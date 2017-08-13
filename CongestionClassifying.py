#!/usr/bin/env python
from debe import *
from tw import *

# This is how it class work
# 1. get unprocessed raws
# 2. get respondent_id from unprocessed raws
# 3. get respondent t_user_id
# 4. pick classifier for that respondent
# 5. get unprocessed raws from respondent
# 6. classify raw
# 7. save to kinds table
# 8. update raws table on column processed
# 9. repeat #5
# 10. repeat #4
class CongestionClassifying(object):
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

    # Get respondents from unprocessed raws
    def get_respondents_unprocessed(self, limitQuery):
        data = []
        query = sessionPostgresTraffic.query(Raw.respondent_id).\
            filter(Raw.processed == False).\
            group_by(Raw.respondent_id).\
            limit(limitQuery)
        for q in query:
            data.append(q.respondent_id)
        return data

    # Get t_user_id
    def find_twitter_user_id(self, respondent_id):
        query = sessionPostgresTraffic.query(Respondent.t_user_id).\
            filter(Respondent.id == respondent_id).\
            first()

        try:
            return int(query[0])
        except:
            # default, use elshinta t_user_id
            return 121640063

    # Get unprocessed raws
    def get_raws_unprocessed(self, respondent_id, limitQuery):
        data = []
        query = sessionPostgresTraffic.query(Raw).\
            filter(Raw.respondent_id == respondent_id, Raw.processed == False).\
            order_by(desc(Raw.t_time)).\
            limit(limitQuery)
        #query = sessionPostgresTraffic.query(Raw).\
            #filter(Raw.respondent_id == respondent_id, Raw.t_time.between('2017-07-10 00:00:00', '2017-07-10 23:59:00')).\
            #limit(limitQuery)
        for q in query:
            data.append([q.id, q.t_id, q.info])
        return data

    # Get analyzer
    def find_analyzer(self, t_user_id):
        #import os.path
        import pickle
        classifiers_dir = '/home/aan/congestion/relevant_classifiers/'
        #if os.path.exists(classifiers_dir + 'classifier_' + t_user_id + '.pickle') == True:
        try:
            analyzer = pickle.load(open(classifiers_dir + 'classifier_' + t_user_id + '.pickle', 'rb'))
        except:
            analyzer = pickle.load(open(classifiers_dir + 'classifier_121640063.pickle', 'rb'))
        return analyzer

    def cleaning(self, datum):
        import string
        import re
        data = datum
        # remove url, pic twitter and mentionp
        data = re.sub(r"(?:\RT @|@|pic.twitter.com|https?\://)\S+", '', data)
        #substitute - to space
        data = data.replace('-', ' ')
        # remove tab and new line
        data = data.replace('\n', ' ')
        data = data.replace('\t', ' ')
        # remove punctuation
        translator = str.maketrans('', '', string.punctuation)
        data = data.translate(translator)
        # remove non ascii
        data = re.sub(r'[^\x00-\x7F]+', '', data)
        # remove emoji
        #data = data.decode('unicode_escape').encode('ascii', 'ignore')
        emoji_pattern = re.compile("["
            "\U0001F600-\U0001F64F"
            "\U0001F300-\U0001F5FF"
            "\U0001F680-\U0001F6FF"
            "\U0001F1E0-\U0001F1FF"
            "]+", flags=re.UNICODE)
        data = emoji_pattern.sub(r'', data)
        # remove space more than 1
        data = re.sub(" +", " ", data)
        data = data.strip()
        data = data.lower()
        return data

    # Get classify
    def find_classification(self, info, analyzer):
        spam_ham = analyzer.classify(info)
        if spam_ham == 'ham' or spam_ham == 'HAM':
            data = 1
        else:
            data = 2

        return data

    # Update raws
    def update_raw_data(self, raw_id):
        query = sessionPostgresTraffic.query(Raw).\
            filter(Raw.id == raw_id).\
            first()
        query.processed = True
        sessionPostgresTraffic.commit()

    # Saving kinds
    def insert_kind_data(self, data):
        temp = Kind(
            raw_id = data[0],
            classification_id = data[3],
            t_id = data[1]
        )
        sessionPostgresTraffic.add(temp)

    def main(self):
        self.get_start_time()
        limitQuery = 50
        #limitQuery = 100
        respondents = self.get_respondents_unprocessed(limitQuery)
        #respondents = [17, 49]
        results = []
        if len(respondents) > 0:
            for r in respondents:
                t_user_id = self.find_twitter_user_id(r)
                analyzer = self.find_analyzer(t_user_id)
                data = self.get_raws_unprocessed(r, limitQuery)
                if len(data) > 0:
                    for d in data:
                        d[2] = self.cleaning(d[2])
                        classification_id = self.find_classification(d[2], analyzer)
                        self.insert_kind_data([d[0], d[1], d[2], classification_id])
                        results.append([d[0], d[1], d[2], classification_id])
            sessionPostgresTraffic.commit()
        else:
            results = []

        if len(results) > 0:
            for r in results:
                self.update_raw_data(r[0])
                print(r)

            print('Banyak Data', str(len(results)))
            self.get_finish_time()

def main():
    CongestionClassifying()

if __name__ == '__main__':
    main()
