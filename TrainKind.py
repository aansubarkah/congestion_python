#!/usr/bin/env python
from debe import *
from textblob.classifiers import NaiveBayesClassifier
from os.path import isfile, join
from os import listdir
import datetime
import sys
import pickle
import shutil
import json

mypath = '/home/aan/congestion/relevant_classifiers/'
#stopwords_path = '/home/aan/congestion/id.stopwords.02.01.2016.txt'
denomination_start = int(sys.argv[1])
denomination_end = int(sys.argv[2])
account = int(sys.argv[3])
limit = int(sys.argv[4])

# Convert denomination_id to date time
queryStart = sessionPostgresTraffic.query(TrainKind).\
    filter(TrainKind.denomination_id == denomination_start).\
    first()
endTime = queryStart.t_time
#print(endTime)

queryEnd = sessionPostgresTraffic.query(TrainKind).\
    filter(TrainKind.denomination_id == denomination_end).\
    first()
startTime = queryEnd.t_time
#print(startTime)
# Get all accounts to train
if account == 0:
    query = sessionPostgresTraffic.query(Respondent).\
        filter(Respondent.official == True, Respondent.t_user_id != None, Respondent.id != 11).\
        all()
else:
    query = sessionPostgresTraffic.query(Respondent).\
        filter(Respondent.id == account).\
        all()

accounts = [[q.id, q.name, q.t_user_id] for q in query]
#print(accounts)

# Get all pickle
pick = [f for f in listdir(mypath) if isfile(join(mypath, f))]
#print(pick)

def cleaning(datum):
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

for a in accounts:
    # Check if HAM is >= limit
    newLimit = 0
    hamLimit = 0
    spamLimit = 0
    countHam = sessionPostgresTraffic.query(func.count(TrainKind.denomination_id)).\
        filter(TrainKind.t_time.between(startTime, endTime)).\
        filter(TrainKind.classification_id == 1).\
        filter(TrainKind.respondent_id == a[0])
    newLimit = countHam.scalar()
    hamLimit = countHam.scalar()
    countSpam = sessionPostgresTraffic.query(func.count(TrainKind.denomination_id)).\
        filter(TrainKind.t_time.between(startTime, endTime)).\
        filter(TrainKind.classification_id == 2).\
        filter(TrainKind.respondent_id == a[0])
    spamLimit = countSpam.scalar()
    if countSpam.scalar() < newLimit:
        newLimit = countSpam.scalar()
    #print(a[1], countHam.scalar(), countSpam.scalar(), newLimit)

    if hamLimit > limit:
        hamLimit = limit
    if spamLimit > limit:
        spamLimit = limit
    if newLimit > limit:
        newLimit = limit

    if hamLimit > 0 and spamLimit > 0:
        queryHam = sessionPostgresTraffic.query(TrainKind).\
            filter(TrainKind.t_time.between(startTime, endTime)).\
            filter(TrainKind.classification_id == 1).\
            filter(TrainKind.respondent_id == a[0]).\
            order_by(func.random()).\
            limit(hamLimit)
            #order_by(TrainKind.t_time.desc()).\
            #limit(hamLimit)
        dataHam = [(q.info, q.classification_name) for q in queryHam]
        querySpam = sessionPostgresTraffic.query(TrainKind).\
            filter(TrainKind.t_time.between(startTime, endTime)).\
            filter(TrainKind.classification_id == 2).\
            filter(TrainKind.respondent_id == a[0]).\
            order_by(func.random()).\
            limit(spamLimit)
            #order_by(TrainKind.t_time.desc()).\
            #limit(spamLimit)
        dataSpam = [(q.info, q.classification_name) for q in querySpam]
        data = dataHam + dataSpam
        # create json
        dataJson = []
        for q in queryHam:
            datum = {}
            datum['raw_id'] = q.raw_id
            datum['original_info'] = q.info
            datum['info'] = cleaning(q.info)
            datum['class'] = q.classification_name
            datum['respondent'] = q.respondent_name
            dataJson.append(datum)
        for q in querySpam:
            datum = {}
            datum['raw_id'] = q.raw_id
            datum['original_info'] = q.info
            datum['info'] = cleaning(q.info)
            datum['class'] = q.classification_name
            datum['respondent'] = q.respondent_name
            dataJson.append(datum)
        #for d in dataJson:
            #print(d['info'])
        print(dataJson)
        jsonName = 'classification_name_' + str(account) + '.json'
        with open(jsonName, 'w') as f:
            json.dump(dataJson, f, indent=4)
        #print(data)

        # Train
        cl = NaiveBayesClassifier(data)
        pickle_new_name = mypath + 'classifier_' + str(a[2]) + '.pickle'
        pickle_rename = mypath + 'classifier_' + str(a[2]) + '_' + '{0:%d%m%Y}'.format(datetime.datetime.now()) + '.pickle'

        # rename old pickle
        if 'classifier_' + str(a[2]) + '.pickle' in pick:
            #print('ada')
            shutil.copyfile(pickle_new_name, pickle_rename)
        file = open(pickle_new_name, 'wb')
        pickle.dump(cl, file)
