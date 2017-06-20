from tw_dimanamacet import *

class OnlineTwitterTweeting(object):
    def __init__(self):
        self.tweets = []
        self.main()

    def utc_to_local(self, utc_dt):
        import pytz, time

        local_tz = pytz.timezone('Asia/Jakarta')
        local_dt = utc_dt.replace(tzinfo=pytz.utc).astimezone(local_tz)
        return local_tz.normalize(local_dt)

    def get_start_time(self):
        import time, timeit

        self.startText = time.strftime("%H:%M:%S")
        self.startTime = timeit.default_timer()

    def get_finish_time(self):
        import time, timeit, math

        self.elapsed = math.ceil(timeit.default_timer() - self.startTime)
        self.finishText = time.strftime("%H:%M:%S")

    def insert_log_to_mongo(self, data):
        import pymongo, time

        try:
            dataLen = data.count()
        except:
            dataLen = len(data)

        tweetID = [str(d['tweet']['id']) for d in data]
        markerID = [str(d['marker_id']) for d in data]
        # MongoDB logs object
        mongoClient = pymongo.MongoClient('localhost:27017')
        #mongoClient = pymongo.MongoClient('192.168.0.69:27017')
        logsDB = mongoClient.processing_logs

        self.get_finish_time()

        body = {
            'date': time.strftime("%d-%m-%Y"),
            'start': self.startText,
            'end': self.finishText,
            'elapsed': self.elapsed,
            'rows': dataLen,
            'tweetID': tweetID,
            'markerID': markerID
        }
        logsDB.markers_tweet.insert(body)

    def get_last_n_minutes_data(self, n):
        import pymongo, pytz
        from datetime import datetime, timedelta
        from bson.codec_options import CodecOptions

        datetimeNow = datetime.utcnow()
        datetimeBefore = datetimeNow - timedelta(minutes=int(n))

        mongoClient = pymongo.MongoClient('127.0.0.1:27017')
        markerDB = mongoClient.marker
        markerAwareTime = markerDB.markers.with_options(codec_options=CodecOptions(
            tz_aware = True,
            tzinfo = pytz.timezone('Asia/Jakarta')
        ))
        markers = markerAwareTime.find({
            'created':{
                '$gte':datetimeBefore, '$lt':datetimeNow
            },
            'isTweeted': False
        }).sort('_id', 1)

#        markers = markerAwareTime.find({
#            'created':{
#                '$gte':datetimeBefore, '$lt':datetimeNow
#            },
#            'isTweeted': False,
#            'loc':{
#                '$near':{
#                    '$geometry':{
#                        'type': 'Point',
#                        'coordinates': [float(107.949478), float(-6.573076)]
#                    },
#                    '$minDistance': 100,
#                    '$maxDistance': 1000
#                }
#            }
#        }).sort('_id', -1)
        #markers = markerDB.markers.find().sort('_id', -1).limit(lim)
        return markers

    def create_tweet(self, data):
        tweetList = []
        for d in data:
            textToTweet = 'dimanamacet.com ('
            textToTweet += d['tweet']['created_at'].strftime('%H:%M')
            textToTweet += ') #'
            textToTweet += d['loc']['regency']['alias'].upper()
            textToTweet += ' '
            if d['category']['id'] != 3 and d['category']['id'] != 6:
                textToTweet += '#' + d['category']['name'].upper().replace(' ', '') + ' '
            textToTweet += d['loc']['name']
            if d['category']['id'] == 3 or d['category']['id'] == 6:
                textToTweet += ' #' + d['category']['name'].upper().replace(' ', '') + ' '
            try:
                if d['respondent']['isOfficial'] == True and d['respondent']['active'] == False:
                    testText = textToTweet + ' #TMC'
                    if len(testText) < 140:
                        textToTweet += ' #TMC'
                else:
                    testText = textToTweet + ' #' + d['respondent']['name'].replace(' ', '')
                    if len(testText) < 140:
                        textToTweet += ' #' + d['respondent']['name'].replace(' ', '')
            except:
                testText = textToTweet + ' #' + d['respondent']['name'].replace(' ', '')
                if len(testText) < 140:
                    textToTweet += ' #' + d['respondent']['name'].replace(' ', '')
            textToTweet = textToTweet.replace('  ', ' ')
            textToTweet = textToTweet.strip()
            if textToTweet not in tweetList:
                tweetList.append(textToTweet)
                try:
                    api.update_status(
                        status = textToTweet,
                        lat = d['loc']['coordinates'][1],
                        long = d['loc']['coordinates'][0])
                    self.tweets.append([d['marker_id'], textToTweet])
                except Exception as e:
                    pass

    def update_marker_mongo_data(self, data):
        import pymongo

        mongoClient = pymongo.MongoClient('127.0.0.1:27017')
        markerDB = mongoClient.marker

        for d in data:
            markerDB.markers.update_one(
                {'marker_id': d['marker_id']},
                {'$set': {'isTweeted': True}}
            )

    def insert_tweets_mongo(self):
        import pymongo, time, pytz, datetime
        mongoClient = pymongo.MongoClient('127.0.0.1:27017')
        markerDB = mongoClient.marker
        jakarta = pytz.timezone('Asia/Jakarta')
        if len(self.tweets) > 0:
            for t in self.tweets:
                body = {
                    'date': time.strftime("%d-%m-%Y"),
                    'created': jakarta.localize(datetime.datetime.now()),
                    'time': time.strftime("%H:%M:%S"),
                    'marker_id': t[0],
                    'text': t[1]
                }
                markerDB.tweets.insert(body)

    def main(self):
        self.get_start_time()
        data = self.get_last_n_minutes_data(30)

        if data.count() > 0:
            # Tweeting
            self.create_tweet(data)
            # print(self.tweets)
            # Store tweet to mongo
            self.insert_tweets_mongo()

            # Update marker table
            self.update_marker_mongo_data(data)

            results = data
        else:
            results = []
        #self.insert_log_to_mongo(results)

def main():
    OnlineTwitterTweeting()

if __name__ == '__main__':
    main()
