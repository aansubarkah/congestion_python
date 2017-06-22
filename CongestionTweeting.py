#!/usr/bin/env python
from debe import *
from tewe import *

class CongestionTweeting(object):
    def __init__(self):
        self.tweets = []
        self.tweetList = []
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

    def get_marker_unprocessed(self, minutes=30):
        import pymongo, pytz
        from datetime import datetime, timedelta
        from bson.codec_options import CodecOptions

        datetimeNow = datetime.utcnow()
        datetimeBefore = datetimeNow - timedelta(minutes=int(minutes))

        mongoClient = pymongo.MongoClient('127.0.0.1:27017')
        markerDB = mongoClient.congestion
        markerAwareTime = markerDB.markers.with_options(codec_options=CodecOptions(
            tz_aware = True,
            tzinfo = pytz.timezone('Asia/Jakarta')
        ))
        markers = markerAwareTime.find({
            'created':{
                '$gte':datetimeBefore, '$lt':datetimeNow
            },
            'tweeted': False
        }).sort('_id', -1)

        return markers

    def create_tweet(self, data):
        textToTweet = 'dimanamacet.com ('
        textToTweet += data['tweet']['created_at'].strftime('%H:%M')
        textToTweet += ') #'
        textToTweet += data['loc']['regency']['alias'].upper()
        textToTweet += ' '
        if data['category']['id'] != 3 and data['category']['id'] != 6:
            textToTweet += '#' + data['category']['name'].upper().replace(' ', '') + ' '
        textToTweet += data['loc']['name']
        if data['category']['id'] == 3 or data['category']['id'] == 6:
            textToTweet += ' #' + data['category']['name'].upper().replace(' ', '') + ' '
        try:
            #if data['respondent']['official'] == True and data['respondent']['tmc'] == False:
            if data['respondent']['tmc'] == True:
                testText = textToTweet + ' #TMC'
                if len(testText) < 140:
                    textToTweet += ' #TMC'
            else:
                testText = textToTweet + ' #' + data['respondent']['name'].replace(' ', '')
                if len(testText) < 140:
                    textToTweet += ' #' + data['respondent']['name'].replace(' ', '')
        except:
            testText = textToTweet + ' #' + data['respondent']['name'].replace(' ', '')
            if len(testText) < 140:
                textToTweet += ' #' + data['respondent']['name'].replace(' ', '')
        textToTweet = textToTweet.replace('  ', ' ')
        textToTweet = textToTweet.strip()

        if textToTweet not in self.tweetList:
            self.tweetList.append(textToTweet)
            try:
                api.update_status(
                    status = textToTweet,
                    lat = data['loc']['coordinates'][1],
                    long = data['loc']['coordinates'][0]
                )
                self.tweets.append([data['marker_id'], textToTweet])
            except Exception as e:
                pass

    def update_marker_data_mongo(self, marker_id):
        import pymongo
        mongoClient = pymongo.MongoClient('127.0.0.1:27017')
        markerDB = mongoClient.congestion

        markerDB.markers.update_one(
            {'marker_id': marker_id},
            {'$set': {'tweeted': True}}
        )

    def main(self):
        minutesAgo = 30
        data = self.get_marker_unprocessed(minutesAgo)
        for d in data:
            self.update_marker_data_mongo(d['marker_id'])
            self.create_tweet(d)
            print(d)

def main():
    CongestionTweeting()

if __name__ == '__main__':
    main()
