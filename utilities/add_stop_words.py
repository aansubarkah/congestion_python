#!/usr/bin/env python
from nltk.corpus import stopwords

data = []
custom = []
stoplist = set(stopwords.words('indonesian'))

data = [d for d in stoplist]
# Open stopwords
with open('/home/aan/congestion/id.stopwords.02.01.2016.txt', 'r') as f:
    for c in f:
        if c not in data:
            c = c.replace('\n', '')
            data.append(c)

print(data)
#print(custom)
# Open nltk stopwords
#with open('/home/aan/nltk_data/corpora/stopwords/indonesian', 'w') as f:
    #for line in f:
        #print(line)
    #stopwords = f.readlines()
    #stopwords = [x.strip() for x in stopwords]
    #for s in stopwords:
        #if s not in data:
            #data.append(s)

    #for c in custom:
        #if c not in data:
            #data.append(c)

    #print(data)
