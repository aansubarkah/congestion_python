#!/usr/bin/env python
from debe import *

# Get raw_id from denominations
query = sessionPostgresTraffic.query(Denomination).\
    filter(Denomination.raw_id > 0).\
    with_entities(Denomination.raw_id).\
    all()

# Update Kind
for q in query:
    queryToUpdate = sessionPostgresTraffic.query(Kind).\
        filter(Kind.raw_id == q[0]).\
        first()
    queryToUpdate.verified = True
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

# Update words
for s in syllable_raw_ids:
    print(s)
    sessionPostgresTraffic.query(Word).\
        filter(Word.raw_id == s).\
        update(dict(verified=True))
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

# Update Chunk
for d in data:
    sessionPostgresTraffic.query(Chunk).\
        filter(Chunk.raw_id == d).\
        update(dict(verified=True))
    sessionPostgresTraffic.commit()
    print(d)
