#!/usr/bin/env python
from debe import *

class CongestionTagging(object):
    startText = None
    startTime = None
    finishText = None
    elapsed = None

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
        duration_minutes = divmod(self.elapsed, 60)
        duration_hours = divmod(duration_minutes[0], 60)
        print('Waktu Mulai', self.startText)
        print('Waktu Selesai', self.finishText)
        print('Durasi', str(duration_hours[0]), ':', str(duration_hours[1]), ':', str(duration_minutes[1]))

    # Get unprocessed kinds
    def get_kinds_unprocessed(self, limitQuery):
        data = []
        query = sessionPostgresTraffic.query(ProcessChunking).\
            filter(ProcessChunking.kind_processed == False).\
            order_by(desc(ProcessChunking.t_time)).\
            limit(limitQuery)
        for q in query:
            data.append([q.raw_id, q.kind_id, q.info])
        return data

    def cleaning(self, data):
        import string
        import re
        # remove url, pic twitter and mentionp
        datum = re.sub(r"(?:\RT @|@|pic.twitter.com|https?\://)\S+", '', data)
        #substitute - to space
        datum = datum.replace('-', ' ')

        # remove tab and new line
        datum = datum.replace('\n', ' ')
        datum = datum.replace('\t', ' ')
        # remove punctuation
        translator = str.maketrans('', '', string.punctuation)
        datum = datum.translate(translator)
        # remove non ascii
        datum = re.sub(r'[^\x00-\x7F]+', '', datum)
        # remove emoji
        #data = data.decode('unicode_escape').encode('ascii', 'ignore')
        emoji_pattern = re.compile("["
            "\U0001F600-\U0001F64F"
            "\U0001F300-\U0001F5FF"
            "\U0001F680-\U0001F6FF"
            "\U0001F1E0-\U0001F1FF"
            "]+", flags=re.UNICODE)
        datum = emoji_pattern.sub(r'', datum)
        # remove space more than 1
        datum = re.sub(" +", " ", datum)
        datum = datum.strip()
        datum = datum.lower()

        # remove anything inside ()
        #datum = re.sub(r"\([^)]*\)", "", datum)
        # substitute . to space
        #datum = re.sub(r"\.", " ", datum)
        # remove space more than 1
        #datum = re.sub(" +", " ", datum)
        #datum.replace('(','')
        #datum.replace(')', '')
        #datum = datum.strip()
        #datum = datum.lower()
        return datum

    def tagging(self, data):
        import pickle
        from nltk.tokenize import word_tokenize
        from labels import labels

        tagger = pickle.load(open("/home/aan/congestion/tagged.pickle", "rb"))
        words = tagger.tag(word_tokenize(data))
        datum = []
        for w in words:
            if w[0] == 'arah':
                temp = [w[0], 'DC', 13]
            elif w[1] == '-None-':
                temp = [w[0], 'NN', 2]
            else:
                label = list(labels.values())[list(labels.keys()).index(w[1])]
                temp = [w[0], w[1], label]
            datum.append(temp)
        return datum

    def update_kind_data(self, kind_id):
        query = sessionPostgresTraffic.query(Kind).\
            filter(Kind.id == kind_id).\
            first()
        query.processed = True
        sessionPostgresTraffic.commit()

    def insert_word_data(self, data):
        seq = 0
        for d in data[4]:
            temp = Word(
                raw_id = data[0],
                tag_id = d[2],
                sequence = seq,
                name = d[0]
            )
            seq = seq + 1
            sessionPostgresTraffic.add(temp)

    def insert_syllable_data(self, data):
        seq = 0
        for d in data[4]:
            temp = Syllable(
                user_id = 3,
                raw_id = data[0],
                tag_id = d[2],
                sequence = seq,
                name = d[0]
            )
            seq = seq + 1
            sessionPostgresTraffic.add(temp)

    def main(self):
        self.get_start_time()
        limitQuery = 50
        results = []
        data = self.get_kinds_unprocessed(limitQuery)
        if len(data) > 0:
            for d in data:
                dCleaned = self.cleaning(d[2])
                dTagged = self.tagging(dCleaned)
                self.insert_syllable_data([d[0], d[1], d[2], dCleaned, dTagged])
                self.insert_word_data([d[0], d[1], d[2], dCleaned, dTagged])
                results.append([d[0], d[1], d[2], dCleaned, dTagged])
            sessionPostgresTraffic.commit()
        else:
            results = []

        if len(results) > 0:
            for r in results:
                self.update_kind_data(r[1])
                print(r)

            print('Banyak Data', str(len(results)))
            self.get_finish_time()

def main():
    CongestionTagging()

if __name__ == '__main__':
    main()
