#!/usr/bin/env python
from debe import *

denominations = []
query = sessionPostgresTraffic.query(Denomination).\
    all()

for q in query:
    if q.raw_id == None:
        queryToUpdate = sessionPostgresTraffic.query(Denomination).\
            filter(Denomination.id == q.id).\
            first()
        queryToUpdate.active = False
        sessionPostgresTraffic.commit()
    else:
        if q.raw_id not in denominations:
            denominations.append(q.raw_id)
        else:
            queryToUpdate = sessionPostgresTraffic.query(Denomination).\
                filter(Denomination.id == q.id).\
                first()
            queryToUpdate.active = False
            sessionPostgresTraffic.commit()
