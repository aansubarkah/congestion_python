#!/usr/bin/env python
from debe import *

class CongestionMarkering(object):
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

    def get_machine_unprocessed(self, limitQuery):
        data = []
        query = sessionPostgresTraffic.query(ProcessMarkering).\
            limit(limitQuery)
        for q in query:
            data.append([
                q.raw_id,
                q.media,
                q.info,
                q.lat,
                q.lng,
                q.respondent_id,
                q.respondent_name,
                q.classification_id,
                q.classification_name,
                q.place_id,
                q.place_name,
                q.category_id,
                q.category_name,
                q.weather_id,
                q.weather_name,
                q.spot_id,
                q.score,
                q.user_id,
                q.username,
                q.machine_id
            ])
        return data

    def update_machine_data(self, machine_id):
        query = sessionPostgresTraffic.query(Machine).\
            filter(Machine.id == machine_id).\
            first()
        query.processed = True
        sessionPostgresTraffic.commit()

    def insert_marker_data(self, data):
        temp = Marker(
            category_id = data[0],
            user_id = data[1],
            respondent_id = data[2],
            weather_id = data[3],
            raw_id = data[4],
            lat = data[5],
            lng = data[6],
            info = data[7]
        )
        sessionPostgresTraffic.add(temp)

    def main(self):
        limitQuery = 50
        results = []
        data = self.get_machine_unprocessed(limitQuery)
        if len(data) > 0:
            for d in data:
                self.insert_marker_data([d[11], d[17], d[5], d[13], d[0], d[3], d[4], d[2]])
                results.append(d)
            sessionPostgresTraffic.commit()

        if len(results) > 0:
            for r in results:
                self.update_machine_data(r[19])
                print(r)

def main():
    CongestionMarkering()

if __name__ == '__main__':
    main()
