#!/usr/bin/env python
from elasticsearch import Elasticsearch
from debe import *
import sys

index_name = 'congestion'
doc_type = 'congestion_doc'

es = Elasticsearch([{
        'host': '127.0.0.1',
        'port': 9200
    }])
place_id = int(sys.argv[1])
if place_id > 0:
    p = sessionPostgresTraffic.query(ProcessSpot).\
        filter(ProcessSpot.place_id == place_id).\
        first()
    body_insert = {
        'id': p.place_id,
        'name': p.place_name,
        'lat': p.place_lat,
        'lng': p.place_lng,
        'regency': {
            'id': p.regency_id,
            'name': p.regency_name
        }
    }
    body_update = {
        'doc': {
            'id': p.place_id,
                'name': p.place_name,
                'lat': p.place_lat,
                'lng': p.place_lng,
                'regency': {
                    'id': p.regency_id,
                    'name': p.regency_name
                }
            }
    }
    if es.exists(index=index_name, doc_type=doc_type, id=p.place_id):
        es.update(index=index_name, id=p.place_id, doc_type=doc_type, body=body_update)
    else:
        es.create(index=index_name, id=p.place_id, doc_type=doc_type, body=body_insert)

    mappings = {
        'mappings': {
            'place_doc': {
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
    print(str(p.place_id))
