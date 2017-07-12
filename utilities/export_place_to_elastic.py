#!/usr/bin/env python
from elasticsearch import Elasticsearch
from prettytable import PrettyTable
from debe import *

index_name = 'congestion'
doc_type = 'congestion_doc'

es = Elasticsearch([{
        'host': '127.0.0.1',
        'port': 9200
    }])
# remove index
if es.indices.exists(index=index_name):
    es.indices.delete(index=index_name, ignore=[400, 404])

places = sessionPostgresTraffic.query(ProcessSpot).\
    all()

number = 1
table = PrettyTable(["No", "Name", "Lat", "Lng", "Regency"])
#table.align["Name"] = "l"
table.align = "l"
for p in places:
    table.add_row([number, p.place_name, p.place_lat, p.place_lng, p.regency_name])
    body = {
        'id': p.place_id,
        'name': p.place_name,
        'lat': p.place_lat,
        'lng': p.place_lng,
        'regency': {
            'id': p.regency_id,
            'name': p.regency_name
        }
    }
    es.create(index=index_name, id=p.place_id, doc_type=doc_type, body=body)
    number += 1

mappings = {
    'mappings': {
        'congestion_doc': {
            'properties': {
                'name': {
                    'type': 'string',
                    'similarity': 'BM25'
                }
            }
        }
    }
}
es.indices.create(index=index_name, body=mappings, ignore=400)
print(table)
