#!/usr/bin/env python
from debe import *

data = []
query = sessionPostgresTraffic.query(Syllable).\
    all()

for q in query:
    newId = str(q.raw_id) + '-' + str(q.sequence)
    if newId not in data:
        data.append(newId)
    else:
        queryToUpdate = sessionPostgresTraffic.query(Syllable).\
            filter(Syllable.id == q.id).\
            first()
        queryToUpdate.active = False
        sessionPostgresTraffic.commit()
        print(str(q.id))
