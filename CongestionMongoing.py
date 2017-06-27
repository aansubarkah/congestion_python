#!/usr/bin/env python
from debe import *

class CongestionMongoing(object):
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

    def get_marker_unprocessed(self, limitQuery):
        from datetime import datetime, timedelta

        currentTime = self.utc_to_local(datetime.utcnow())
        minutesAgo = currentTime - timedelta(minutes=30)
        data = []
        query = sessionPostgresTraffic.query(ProcessMongoing).\
            filter(ProcessMongoing.marker_created > minutesAgo).\
            limit(limitQuery)
        for q in query:
            respondentRegency = []
            queryResponentRegency = sessionPostgresTraffic.query(ProcessRegency).\
                filter(ProcessRegency.region_id == q.respondent_region_id).\
                all()
            respondentRegency = [{'regency_id': r.regency_id, 'regency_name': r.regency_name, 'regency_alias': r.regency_alias} for r in queryResponentRegency]

            queryPlace = sessionPostgresTraffic.query(Place).\
                filter(Place.lat == q.marker_lat, Place.lng == q.marker_lng ).\
                first()
            queryRegency = sessionPostgresTraffic.query(Regency).\
                filter(Regency.id == queryPlace.regency_id).\
                first()
            place = {
                'id': queryPlace.id,
                'lat': queryPlace.lat,
                'lng': queryPlace.lng,
                'name': queryPlace.name,
                'regency': {
                    'id': queryRegency.id,
                    'name': queryRegency.name,
                    'alias': queryRegency.alias
                }
            }

            data.append({
                'raw_id': q.raw_id,
                'tweet_text': q.tweet_text,
                'tweet_media': q.tweet_media,
                'tweet_time': q.tweet_time,
                'tweet_id': q.tweet_id,
                'tweet_url': q.tweet_url,
                'tweet_user_id': q.tweet_user_id,
                'tweet_user_screen_name': q.tweet_user_screen_name,
                'tweet_official': q.tweet_official,
                'respondent_id': q.respondent_id,
                'respondent_active': q.respondent_active,
                'respondent_tmc': q.respondent_tmc,
                'respondent_region_id': q.respondent_region_id,
                'respondent_region_name': q.respondent_region_name,
                'respondent_name': q.respondent_name,
                'respondent_regency': respondentRegency,
                'user_id': q.user_id,
                'user_email': q.user_email,
                'marker_id': q.marker_id,
                'marker_info': q.marker_info,
                'marker_created': q.marker_created,
                'marker_lat': q.marker_lat,
                'marker_lng': q.marker_lng,
                'category_id': q.category_id,
                'category_name': q.category_name,
                'weather_id': q.weather_id,
                'weather_name': q.weather_name,
                'place': place
            })
        return data

    def update_marker_data(self, marker_id):
        query = sessionPostgresTraffic.query(Marker).\
            filter(Marker.id == marker_id).\
            first()
        query.exported = True
        sessionPostgresTraffic.commit()

    def insert_marker_data_mongo(self, data):
        import datetime, pytz, pymongo
        mongoClient = pymongo.MongoClient('localhost:27017')
        markersDB = mongoClient.congestion
        jakarta = pytz.timezone('Asia/Jakarta')
        aware_datetime = jakarta.localize(datetime.datetime.now())
        aware_twitter_datetime = jakarta.localize(data['tweet_time'])
        body = {
            'marker_id': data['marker_id'],
            'info': data['marker_info'],
            'exported': False,
            'tweeted': False,
            'created': aware_datetime,
            'category': {
                'id': data['category_id'],
                'name': data['category_name']
            },
            'user': {
                'id': data['user_id'],
                'email': data['user_email']
            },
            'respondent': {
                'id': data['respondent_id'],
                'name': data['respondent_name'],
                'official': data['tweet_official'],
                'active': data['respondent_active'],
                'tmc': data['respondent_tmc'],
                'region': {
                    'id': data['respondent_region_id'],
                    'name': data['respondent_region_name'],
                    'regency': data['respondent_regency']
                }
            },
            'weather': {
                'id': data['weather_id'],
                'name': data['weather_name']
            },
            'loc': {
                'type': 'Point',
                'coordinates': [data['place']['lng'], data['place']['lat']],
                'name': data['place']['name'],
                'id': data['place']['id'],
                'regency': {
                    'id': data['place']['regency']['id'],
                    'name': data['place']['regency']['name'],
                    'alias': data['place']['regency']['alias']
                }
            },
            'tweet': {
                'id': data['tweet_id'],
                'created_at': aware_twitter_datetime,
                'media': data['tweet_media'],
                'text': data['tweet_text'],
                'url': data['tweet_url'],
                'user': {
                    'id': data['tweet_user_id'],
                    'screen_name': data['tweet_user_screen_name']
                    }
            }
        }
        markersDB.markers.insert(body)

    def main(self):
        limitQuery = 50
        results = []
        data = self.get_marker_unprocessed(limitQuery)
        for d in data:
            self.insert_marker_data_mongo(d)
            self.update_marker_data(d['marker_id'])
            results.append(d)
            print(d)

def main():
    CongestionMongoing()

if __name__ == '__main__':
    main()
