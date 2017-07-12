#!/usr/bin/env python
from debe import *
from nltk.tag import UnigramTagger
from os import listdir
from os.path import isfile, join
import os
import nltk
import json
import pickle

data = []
dataTagger = []
query = sessionPostgresTraffic.query(TrainWord.raw_id).\
    group_by(TrainWord.raw_id).\
    limit(200)

dataJson = []
for q in query:
    datum = {}
    datumWord = []
    querySyllable = sessionPostgresTraffic.query(TrainWord).\
        filter(TrainWord.raw_id == q.raw_id).\
        order_by(TrainWord.sequence).\
        all()

    syllableTemp = []
    info = ''
    for s in querySyllable:
        syllableTemp.append((s.syllable_name, s.tag_name))
        datumWord.append([s.syllable_name, s.tag_name])
        info = s.info
    data.append({'raw_id': q.raw_id, 'word': syllableTemp})
    dataTagger.append(syllableTemp)
    dataJson.append({'raw_id': q.raw_id, 'info': info, 'tags': datumWord})


#print(dataTagger)
# Read .pos
mypath = '/home/aan/congestion/pos/'
number = 1
for f in listdir(mypath):
    if isfile(join(mypath, f)):
        if f.endswith('.pos'):
            with open(join(mypath, f)) as f:
                for line in f:
                    if line:
                        sentence = line.replace('[', '')
                        sentence = sentence.replace(']', '')
                        sentence.strip()
                        if sentence:
                            words = sentence.split()
                            datumWord = []
                            syllableTemp = []
                            info = ''
                            for w in words:
                                a = w.split('/')
                                syllableTemp.append((a[0], a[1]))
                                datumWord.append([a[0], a[1]])
                                info = info + ' ' + a[0]
                            info = info.replace('( ', '(')
                            info = info.replace(' )', ')')
                            info = info.replace(' .', '.')
                            info = info.strip()
                            dataTagger.append(syllableTemp)
                            data.append({'raw_id': 0, 'word': syllableTemp})
                            if datumWord:
                                dataJson.append({'raw_id': 0, 'info': info, 'tags': datumWord})

with open('word_tag.json', 'w') as f:
    json.dump(dataJson, f)

dataTagger = [x for x in dataTagger if x]
tagger = UnigramTagger(dataTagger, backoff=nltk.DefaultTagger('NN'))

# dump to pickle
#file = open('tagged.pickle', 'wb')
#pickle.dump(tagger, file)
