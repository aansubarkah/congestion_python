#!/usr/bin/env python
from sqlalchemy import Table, Column, Integer, Numeric, String, Text, ForeignKey, DateTime, MetaData, create_engine, desc, func, cast, and_, or_, not_, BigInteger, Boolean, Float, exists, DATE
from sqlalchemy.orm import sessionmaker, relationship
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql import text
from datetime import datetime

# DB Connection
user = 'user'
password = 'jayapura'
host = 'localhost'
#host = '192.168.0.69'
port = 5432
dbTraffic = 'c0ng3st10n'

urlPostgres = 'postgresql://{}:{}@{}:{}/{}'

urlPostgresTraffic = urlPostgres.format(user, password, host, port, dbTraffic)

enginePostgresTraffic = create_engine(urlPostgresTraffic, client_encoding='utf-8')

SessionPostgresTraffic = sessionmaker(bind=enginePostgresTraffic)
sessionPostgresTraffic = SessionPostgresTraffic()
BasePostgresTraffic = declarative_base()

# DB Table
class Raw(BasePostgresTraffic):
    __tablename__ = 'raws'
    id = Column(BigInteger, primary_key=True)
    respondent_id = Column(BigInteger(), default=17) # SbyTraffiServ
    t_id = Column(BigInteger())
    t_time = Column(DateTime())
    info = Column(Text())
    url = Column(String(255))
    media = Column(String(255))
    width = Column(Integer())
    height = Column(Integer())
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    processed = Column(Boolean, default=False)
    active = Column(Boolean, default=True)

class Respondent(BasePostgresTraffic):
    __tablename__ = 'respondents'
    id = Column(BigInteger, primary_key=True)
    region_id = Column(Integer())
    t_user_id = Column(BigInteger())
    name = Column(String(255))
    t_user_screen_name = Column(String(255))
    official = Column(Boolean, default=False)
    active = Column(Boolean, default=True)
    tmc = Column(Boolean, default=False)

class Kind(BasePostgresTraffic):
    __tablename__ = 'kinds'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    classification_id = Column(Integer())
    processed = Column(Boolean, default=False)
    active = Column(Boolean, default=True)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    t_id = Column(BigInteger())
    verified = Column(Boolean, default=False)
    trained = Column(Boolean, default=False)
    chunked = Column(Boolean, default=False)

class Word(BasePostgresTraffic):
    __tablename__ = 'words'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    tag_id = Column(Integer())
    sequence = Column(Integer())
    name = Column(String(255))
    verified = Column(Boolean, default=False)
    trained = Column(Boolean, default=False)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    processed = Column(Boolean, default=False)
    active = Column(Boolean, default=True)

class Syllable(BasePostgresTraffic):
    __tablename__ = 'syllables'
    id = Column(BigInteger, primary_key=True)
    user_id = Column(BigInteger())
    raw_id = Column(BigInteger())
    tag_id = Column(Integer())
    sequence = Column(Integer())
    name = Column(String(255))
    trained = Column(Boolean, default=False)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    active = Column(Boolean, default=True)

class Chunk(BasePostgresTraffic):
    __tablename__ = 'chunks'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    place = Column(String(255))
    condition = Column(String(255))
    weather = Column(String(255))
    processed = Column(Boolean, default=False)
    active = Column(Boolean, default=True)
    verified = Column(Boolean, default=False)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)

class Piece(BasePostgresTraffic):
    __tablename__ = 'pieces'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    user_id = Column(BigInteger())
    place = Column(String(255))
    condition = Column(String(255))
    weather = Column(String(255))
    trained = Column(Boolean, default=False)
    active = Column(Boolean, default=True)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)

class ProcessChunking(BasePostgresTraffic):
    __tablename__ = 'process_chunking'
    raw_id = Column(BigInteger())
    respondent_id = Column(BigInteger())
    t_time = Column(DateTime())
    info = Column(Text())
    respondent_name = Column(String(255))
    t_user_id = Column(BigInteger())
    kind_id = Column(BigInteger, primary_key=True)
    kind_processed = Column(Boolean())
    kind_chunked = Column(Boolean())
    classification_id = Column(Integer())
    classification_name = Column(String(255))

class ProcessLocating(BasePostgresTraffic):
    __tablename__ = 'process_locating'
    raw_id = Column(BigInteger())
    respondent_id = Column(BigInteger())
    t_time = Column(DateTime())
    info = Column(Text())
    respondent_name = Column(String(255))
    t_user_id = Column(BigInteger())
    kind_id = Column(BigInteger())
    word_id = Column(BigInteger, primary_key=True)
    sequence = Column(Integer())
    name = Column(String(255))
    tag_id = Column(Integer())
    tag_name = Column(String(255))
