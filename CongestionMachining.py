#!/usr/bin/env python
from debe import *

class CongestionMachining(object):
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

    def get_spots_unprocessed(self, limitQuery):
        data = []
        query = sessionPostgresTraffic.query(ProcessMachining).\
            limit(limitQuery)

        for q in query:
            data.append([
                q.raw_id,
                q.media,
                q.info,
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
                q.place,
                q.condition,
                q.weather
            ])
        return data

    def update_spot_data(self, spot_id):
        query = sessionPostgresTraffic.query(Spot).\
            filter(Spot.id == spot_id).\
            first()
        query.processed = True
        sessionPostgresTraffic.commit()

    def insert_machine_data(self, data):
        if (data[2] is None) or (data[2] == 0):
            data[2] = 0

        if (data[3] is None) or (data[3] == 0):
            data[3] = 0

        temp = Machine(
            raw_id = data[0],
            classification_id = data[1],
            place_id = data[2],
            category_id = data[3],
            weather_id = data[4],
            info = data[5],
            media = data[6],
            spot_id = data[7]
        )
        sessionPostgresTraffic.add(temp)

    def main(self):
        limitQuery = 50
        results = []
        data = self.get_spots_unprocessed(limitQuery)
        if len(data) > 0:
            for d in data:
                self.insert_machine_data([d[0], d[4], d[6], d[8], d[10], d[2], d[1], d[12]])
                results.append(d)
            sessionPostgresTraffic.commit()

        if len(results) > 0:
            for r in results:
                self.update_spot_data(r[12])
                print(r)

def main():
    CongestionMachining()

if __name__ == '__main__':
    main()
