#from four_db_remote import *
from online_four_db import *

class OnlineTwitterMarkerMongo(object):
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

    def insert_log_to_mongo(self, data):
        import pymongo, time

        dataLen = len(data)
        tweetID = [str(d[8][0]) for d in data]
        markerID = [str(d[0]) for d in data]
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
        logsDB.markers_mongo.insert(body)

    def get_last_30_minutes_data(self):
        from datetime import datetime, timedelta

        currentTime = self.utc_to_local(datetime.utcnow())
        minutesAgo = currentTime - timedelta(minutes=30)

        markers = sessionPostgresTraffic.query(MarkerPostgres).\
            filter(
                MarkerPostgres.isExported == False,
                MarkerPostgres.created > minutesAgo
            ).\
            order_by(MarkerPostgres.created).\
            limit(50)

        datum = [[
            t.id,
            t.category_id,
            t.weather_id,
            t.info,
            [t.lat, t.lng],
            t.source_id] for t in markers]

        # Get raws and places data
        for t in datum:
            # Get category data
            categoryData = sessionPostgresTraffic.query(CategoryPostgres).\
                filter_by(id = t[1]).\
                first()
            t.append([categoryData.id, categoryData.name])
            # 6

            # Get user data
            userData = sessionPostgresTraffic.query(UserPostgres).\
                filter_by(id = 3).\
                first()
            t.append([userData.id, userData.email, userData.username])
            # 7

            # Get raws data
            rawData = sessionPostgresRaw.query(Raw).\
                filter_by(id = t[5]).\
                first()
            t.append([
                rawData.tweetID,
                rawData.tweetTime,
                rawData.media,
                rawData.info,
                rawData.url,
                rawData.tweetUScreenName,
                rawData.tweetUID
            ])
            # 8

            # Get respondent data
            respondentData = sessionPostgresTraffic.query(RespondentPostgres).\
                filter_by(id = rawData.respondent_id).\
                first()
            t.append([respondentData.id, respondentData.name, respondentData.isOfficial, respondentData.active, respondentData.contact])
            # 9

            # Get region data
            regionData = sessionPostgresTraffic.query(RegionPostgres).\
                filter_by(id = respondentData.region_id).\
                first()
            t.append([regionData.id, regionData.name])
            # 10

            # Get regencies_regions data
            regencyregionData = sessionPostgresTraffic.query(RegencyRegionPostgres).\
                filter_by(region_id = respondentData.region_id).\
                all()
            t.append([r.regency_id for r in regencyregionData])
            # 11

            # Get places data
            placeData = sessionPostgresTraffic.query(PlacePostgres).\
                filter(PlacePostgres.lat == t[4][0], PlacePostgres.lng == t[4][1]).\
                first()

            # Get regency data
            regencyData = sessionPostgresTraffic.query(RegencyPostgres).\
                filter_by(id = placeData.regency_id).\
                first()
            t.append([placeData.id, placeData.name, placeData.lat, placeData.lng, placeData.regency_id, regencyData.name, regencyData.alias])
            # 12

            # Get weather data
            weatherData = sessionPostgresTraffic.query(WeatherPostgres).\
                filter_by(id = t[2]).\
                first()
            t.append([weatherData.id, weatherData.name])
            # 13

        return datum

    def show_raw_data(self, data):
        from prettytable import PrettyTable

        if len(data) > 0:
            table = PrettyTable([
                'No',
                'ScreenName',
                'Text',
                'Place',
                'Condition',
                'PlaceName',
                'ConditionName',
                'Score'
            ])
            table.align = 'l'

            index = 0
            for d in data:
                table.add_row([
                    index + 1,
                    d[4],
                    d[1],
                    d[5],
                    d[6],
                    d[9],
                    d[12],
                    d[10]
                ])
                index += 1
            print(table)

    def update_marker_data(self, data):
        if len(data) > 0:
            for d in data:
                sessionPostgresTraffic.query(MarkerPostgres).\
                    filter_by(id = d[0]).\
                    update({
                        'isExported': True
                    })
            sessionPostgresTraffic.commit()

    def insert_marker_mongo_data(self, data):
        import datetime, pytz, pymongo
        if len(data) > 0:
            # MongoDB marker object
            #mongoClient = pymongo.MongoClient('192.168.0.69:27017')
            mongoClient = pymongo.MongoClient('localhost:27017')

            markersDB = mongoClient.marker
            jakarta = pytz.timezone('Asia/Jakarta')

            for d in data:
                #print(d)
                aware_datetime = jakarta.localize(datetime.datetime.now())
                aware_twitter_datetime = jakarta.localize(d[8][1])
                body = {
                    'marker_id': d[0],
                    'info': d[3],
                    'isExported': False,
                    'isTweeted': False,
                    'created': aware_datetime,
                    'category': {
                        'id': d[6][0],
                        'name': d[6][1]
                    },
                    'user': {
                        'id': d[7][0],
                        'email': d[7][1]
                    },
                    'respondent': {
                        'id': d[9][0],
                        'name': d[9][1],
                        'isOfficial': d[9][2],
                        'active': d[9][3],
                        'region': {
                            'id': d[10][0],
                            'name': d[10][1],
                            'regency': d[11]
                        }
                    },
                    'weather': {
                        'id': d[13][0],
                        'name': d[13][1]
                    },
                    'loc': {
                        'type': 'Point',
                        'coordinates': [d[4][1], d[4][0]],
                        'name': d[12][1],
                        'id': d[12][0],
                        'regency': {
                            'id': d[12][4],
                            'name': d[12][5],
                            'alias': d[12][6]
                        }
                    },
                    'tweet': {
                        'id': d[8][0],
                        'created_at': aware_twitter_datetime,
                        'media': d[8][2],
                        'text': d[8][3],
                        'url': d[8][4],
                        'user': {
                            'id': d[8][6],
                            'screen_name': d[8][5]
                            }
                    }
                }
                markersDB.markers.insert(body)
            #markersDB.markers.create_index([
                #('loc', pymongo.GEOSPHERE)
            #])

    def insert_main_mongo_data(self, data):
        import datetime, pytz, pymongo
        import json
        import requests

        def datetime_handler(x):
            if isinstance(x, datetime.datetime):
                return x.isoformat()
            raise TypeError("Unknown type")

        if len(data) > 0:
            jakarta = pytz.timezone('Asia/Jakarta')

            for d in data:
                #print(d)
                if d[8][2] and not d[8][2].isspace():
                    isTwitImageExist = 1
                else:
                    isTwitImageExist = 0

                if d[8][4] and not d[8][4].isspace():
                    isTwitURLExist = 1
                else:
                    isTwitURLExist = 0

                aware_datetime = jakarta.localize(datetime.datetime.now())
                aware_twitter_datetime = jakarta.localize(d[8][1])
                postMarkerview = {
                    'id': d[0],
                    'category_id': d[1],
                    'user_id': d[7][0],
                    'respondent_id': d[9][0],
                    'weather_id': d[2],
                    'lat': d[4][0],
                    'lng': d[4][1],
                    'created': aware_datetime,
                    'modified': aware_datetime,
                    'info': d[3],
                    'twitUserID': d[8][6],
                    'twitID': d[8][0],
                    'twitTime': aware_twitter_datetime,
                    'twitURL': d[8][4],
                    'twitPlaceID': None,
                    'twitPlaceName': d[12][1],
                    'isTwitPlacePrecise': False,
                    'twitImage': d[8][2],
                    'pinned': False,
                    'cleared': False,
                    'active': True,
                    'category_name': d[6][1],
                    'username': d[7][2],
                    'user_email': d[7][1],
                    'respondent_name': d[9][1],
                    'respondent_contact': d[9][4],
                    'weather_name': d[13][1],
                    'place_name': d[12][1],
                    'isTwitUserIDExist': 1,
                    'isTwitExist': 1,
                    'isTwitImageExist': isTwitImageExist,
                    'isTwitURLExist': isTwitURLExist,
                    'isPlaceNameExist': 1
                }
                #print(postMarkerview)
                r = requests.post('http://apimarkerviews.dimanamacet.id/markerviews.json', data=json.dumps(postMarkerview, default=datetime_handler), headers={'content-type': 'application/json'})
                #print(r)

    def main(self):
        self.get_start_time()
        data = self.get_last_30_minutes_data()
        if len(data) > 0:
            # Update machine table
            self.update_marker_data(data)

            # Insert to markers table
            self.insert_marker_mongo_data(data)

            # Insert to dimanamacet server
            self.insert_main_mongo_data(data)

            results = data
        else:
            results = []
        # Insert to logs on mongo
        #self.insert_log_to_mongo(results)
        # Show data in pretty table
        #self.show_raw_data(results)

def main():
    OnlineTwitterMarkerMongo()

if __name__ == '__main__':
    main()
