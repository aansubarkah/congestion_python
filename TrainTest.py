#!/usr/bin/env python
from debe import *

query = sessionPostgresTraffic.query(TrainKind).\
    all()
data = [(q.info, q.classification_name) for q in query]
print(data)
