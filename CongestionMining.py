from debe import *
from tw import *

class CongestionMining(object):
    def __init__(self):
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

    # Function to get respondent_id
    def find_respondent_id(self, t_user_id):
        query = sessionPostgresTraffic.query(Respondent.id).\
            filter(Respondent.t_user_id == t_user_id).\
            first()
        #print(query)
        try:
            return int(query[0])
        except:
            return 1

    def get_last_timeline(self, since_id):
        try:
            data = api.home_timeline(since_id=since_id, count=100)
        except:
            data = api.home_timeline(since_id=1, count=100)

        return data

    def insert_timeline_data(self, data):
        import time

        respondent_id = self.find_respondent_id(data.user.id)
        twit_id = data.id
        twit_time = self.utc_to_local(data.created_at)
        twit_time = twit_time.strftime('%Y-%m-%d %H:%M:%S')
        info = data.text
        try:
            url = data.entities['urls'][0]['expanded_url']
        except:
            url = ''

        try:
            media = data.entities['media'][0]['media_url_https']
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

        # For displaying purpose
        data = [respondent_id, twit_id, twit_time, info, url, media, width, height, processed, active]
        return data
        #sessionPostgresTraffic.commit()

    def main(self):
        max_id = sessionPostgresTraffic.query(func.max(Raw.t_id).label("max_id")).one()
        data = self.get_last_timeline(max_id)
        results = []
        if len(data) > 0:
            for d in data:
                if (d.user.id != 3555146480) and (d.user.id != 3517023912):
                    # Check if tweet is exists on db
                    (ret, ), = sessionPostgresTraffic.query(exists().where(Raw.t_id==d.id))
                    # Only process if not exists on db
                    if ret is False:
                        result = self.insert_timeline_data(d)
                        results.append(result)
                        print(result)
            sessionPostgresTraffic.commit()
        else:
            results = []

def main():
    CongestionMining()

if __name__ == '__main__':
    main()
