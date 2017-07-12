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
            datum['info'] = q.info
            datum['class'] = q.classification_name
            datum['respondent'] = q.respondent_name
            dataJson.append(datum)
        for q in querySpam:
            datum = {}
            datum['raw_id'] = q.raw_id
            datum['info'] = q.info
            datum['class'] = q.classification_name
            datum['respondent'] = q.respondent_name
            dataJson.append(datum)
        #for d in dataJson:
            #print(d['info'])
        jsonName = 'classification_name_' + str(account) + '.json'
        with open(jsonName, 'w') as f:
            json.dump(dataJson, f)
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
