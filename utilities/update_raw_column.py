#!/usr/bin/env python
from debe import *

# Get raw_id from denominations
query = sessionPostgresTraffic.query(Denomination).\
    filter(Denomination.raw_id > 0).\
    with_entities(Denomination.raw_id).\
    all()

# Update Raw Classifying Column
for q in query:
    queryToUpdate = sessionPostgresTraffic.query(Raw).\
        filter(Raw.id == q[0]).\
        first()
    queryToUpdate.classifying = True
    sessionPostgresTraffic.commit()
    print(q[0])

# Get raw_id from syllables
syllable_raw_ids = []
query = sessionPostgresTraffic.query(Syllable).\
    filter(Syllable.raw_id > 0, Syllable.verified == True).\
    with_entities(Syllable.raw_id).\
    all()

for q in query:
    if q[0] not in syllable_raw_ids:
        syllable_raw_ids.append(q[0])

# Update Raw Tagging Column
for s in syllable_raw_ids:
    print(s)
    sessionPostgresTraffic.query(Raw).\
        filter(Raw.id == s).\
        update(dict(tagging=True))
    sessionPostgresTraffic.commit()

# Get raw_id from pieces
query = sessionPostgresTraffic.query(Piece).\
    filter(Piece.raw_id > 0).\
    with_entities(Piece.raw_id).\
    all()
data = []
for q in query:
    if q[0] not in data:
        data.append(q[0])

# Update Raw Chunking Column
for d in data:
    sessionPostgresTraffic.query(Raw).\
        filter(Raw.id == d).\
        update(dict(chunking=True))
    sessionPostgresTraffic.commit()
    print(d)
