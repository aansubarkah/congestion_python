#!/usr/bin/env python
from debe import *

class FpCongestionSpoting(object):
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

    def get_chunks_unprocessed(self, limitQuery):
        data = []
        query = sessionPostgresTraffic.query(ProcessSpoting).\
            limit(limitQuery)

        for q in query:
            regencies = sessionPostgresTraffic.query(RegencyRegion).\
                filter_by(region_id = q.respondent_region_id).\
                all()
            regency = [d.regency_id for d in regencies]

            data.append([
                q.chunk_id,
                q.raw_id,
                q.respondent_region_id,
                q.place,
                q.condition,
                regency
            ])
        return data

    def find_place(self, place, regency_ids):
        print(place)
        from elasticsearch import Elasticsearch
        es = Elasticsearch([{
            'host': 'localhost',
            'port': 9200
        }])

        should = []
        for r in regency_ids:
            should.append({
                'term': {
                    'regency.id': r
                }
            })
        body = {
            'from': 0,
            'size': 1,
            'query': {
                'bool': {
                    'must': [{'match': {'name': place}}],
                    'should': should
                }
            }
        }

        try:
            places = es.search(
                index='congestion',
                body=body
            )
            #print(places)
            if len(places) > 0:
                place = [[
                    t['_id'],
                    t['_source']['name'],
                    t['_score']
                ] for t in places['hits']['hits']]
                #print(places)
                p = place[:1]
                place_id = p[0][0]
                place_name = p[0][1]
                place_score = p[0][2]
            else:
                place_id = 0
                place_name = ''
                place_score = 0
        except:
            place_id = 0
            place_name = ''
            place_score = 0

        return [place_id, place_name, place_score]

    def find_condition(self, condition):
        import difflib

        conditions = [
            'macet',
            'parah',
            'padat',
            'lancar',
            'kecelakaan',
            'waspada',
            'ramai',
            'ramai lancar',
            'normal',
            'kondusif',
            'terkendali',
            'Macet',
            'Padat',
            'Lancar',
            'Kecelakaan',
            'Waspada',
            'Ramai',
            'Ramai Lancar',
            'Normal',
            'Kondusif',
            'Terkendali'
        ]
        conditionsKeyValue = {
            'macet': 1,
            'parah': 1,
            'padat': 2,
            'lancar': 3,
            'kecelakaan': 4,
            'waspada': 5,
            'ramai': 6,
            'ramai lancar': 6,
            'normal': 3,
            'kondusif': 3,
            'terkendali': 3,
            'Macet': 1,
            'Padat': 2,
            'Lancar': 3,
            'Kecelakaan': 4,
            'Waspada': 5,
            'Ramai': 6,
            'Ramai Lancar': 6,
            'Normal': 3,
            'Kondusif': 3,
            'Terkendali': 3
        }
        condition_id = 0
        condition_name = ''
        closestCondition = difflib.get_close_matches(condition, conditions)

        if len(closestCondition) > 1:
            condition_id = conditionsKeyValue.get(closestCondition[0], 3)
            condition_name = closestCondition[0]

        return [condition_id, condition_name]

    def update_chunk_data(self, chunk_id):
        query = sessionPostgresTraffic.query(Chunk).\
            filter(Chunk.id == chunk_id).\
            first()
        query.processed = True
        sessionPostgresTraffic.commit()

    def insert_spot_data(self, data):
        temp = Spot(
            chunk_id = data[0],
            raw_id = data[1],
            place_id = data[2],
            weather_id = 1,
            category_id = data[3],
            score = data[4]
        )
        sessionPostgresTraffic.add(temp)

    def main(self):
        limitQuery = 200
        results = []
        data = self.get_chunks_unprocessed(limitQuery)
        if len(data) > 0:
            for d in data:
                place = self.find_place(d[3], d[5])
                condition = self.find_condition(d[4])
                self.insert_spot_data([d[0], d[1], place[0], condition[0], place[2]])
                results.append([d[0], d[1], d[3], d[4], place[0], place[1], place[2], condition[0], condition[1]])
            sessionPostgresTraffic.commit()

        if len(results) > 0:
            for r in results:
                self.update_chunk_data(r[0])
                print(r)

def main():
    FpCongestionSpoting()

if __name__ == '__main__':
    main()
