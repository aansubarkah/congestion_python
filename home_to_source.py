import pytz
import timeit
import time
import math
from debe import *
from tw import *

textToDump = time.strftime("%H:%M:%S") + '\t'
startTime = timeit.default_timer()

local_tz = pytz.timezone('Asia/Jakarta')

# Function to replace timezone to Jakarta
def utc_to_local(utc_dt):
    local_dt = utc_dt.replace(tzinfo=pytz.utc).astimezone(local_tz)
    return local_tz.normalize(local_dt)

# Function to get respondent_id
def find_respondent_id(t_user_id):
    query = sessionPostgresTraffic.query(Respondent.id).\
        filter(Respondent.t_user_id == t_user_id).\
        first()
    #print(query)
    try:
        return int(query[0])
    except:
        return 1

# Get Max Value of tweetID
t_id = sessionPostgresTraffic.query(func.max(Raw.t_id).label("max_id")).one()

# Get Twitter Home Timeline
try:
    home_tweets = api.home_timeline(since_id=t_id.max_id, count=100)
except:
    home_tweets = api.home_timeline(since_id=1, count=100)

number = 1

for tweet in home_tweets:
    if (tweet.user.id != 3555146480) and (tweet.user.id != 3517023912):
        #print(tweet)
        # @dimanamacetid and @macetsurabaya
        # Check if tweet exists
        (ret, ), = sessionPostgresTraffic.query(exists().where(Raw.t_id==tweet.id))
        if ret is False:
            respondent_id = find_respondent_id(tweet.user.id)
            twit_id = tweet.id
            twit_time = utc_to_local(tweet.created_at)
            twit_time = twit_time.strftime('%Y-%m-%d %H:%M:%S')
            #twit_user_screen_name = tweet.user.screen_name
            info = tweet.text
            #print(str(tweet.user.id) + " | " + tweet.user.screen_name + " | " + tweet.text)
            try:
                url = tweet.entities['urls'][0]['expanded_url']
            except:
                url = ''

            try:
                media = tweet.entities['media'][0]['media_url_https']
            except:
                media = ''

            width = 0
            height = 0
            processed = False
            active = True

            temp = Raw(
                respondent_id = respondent_id,
                t_id = twit_id,
                t_time = twit_time,
                info = info,
                url = url,
                media = media,
                width = width,
                height = height,
                processed = processed,
                active = active
            )

            sessionPostgresTraffic.add(temp)

        #print(str(number) + ' ' + info)
        number = number + 1
# Save to DB
sessionPostgresTraffic.commit()

number -= 1
# Write log file
elapsed = math.ceil(timeit.default_timer() - startTime)
textToDump += time.strftime("%H:%M:%S") + '\t'
textToDump += str(elapsed) + '\t'
textToDump += str(number) + '\n'

with open("log/mining_log.tsv", "a") as logFile:
    logFile.write(textToDump)
