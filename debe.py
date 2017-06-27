#!/usr/bin/env python
from sqlalchemy import Table, Column, Integer, Numeric, String, Text, ForeignKey, DateTime, MetaData, create_engine, desc, func, cast, and_, or_, not_, BigInteger, Boolean, Float, exists, DATE, update
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
    classifying = Column(Boolean, default=False)
    tagging = Column(Boolean, default=False)
    chunking = Column(Boolean, default=False)
    locating = Column(Boolean, default=False)

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

class Denomination(BasePostgresTraffic):
    __tablename__ = 'denominations'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    classification_id = Column(Integer())
    user_id = Column(BigInteger())
    active = Column(Boolean, default=True)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    verified = Column(Boolean, default=False)
    trained = Column(Boolean, default=False)

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
    verified = Column(Boolean, default=False)
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
    processed = Column(Boolean, default=False)
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

class ProcessSpot(BasePostgresTraffic):
    __tablename__ = 'process_spot'
    place_id = Column(BigInteger, primary_key=True)
    place_name = Column(String(255))
    place_lat = Column(Float())
    place_lng = Column(Float())
    regency_id = Column(Integer())
    regency_name = Column(String(255))
    hierarchy_id = Column(Integer())
    hierarchy_name = Column(String(255))

class ProcessSpoting(BasePostgresTraffic):
    __tablename__ = 'process_spoting'
    raw_id = Column(BigInteger())
    respondent_id = Column(BigInteger())
    t_time = Column(DateTime())
    info = Column(Text())
    respondent_name = Column(String(255))
    respondent_region_id = Column(Integer())
    t_user_id = Column(BigInteger())
    kind_id = Column(BigInteger())
    chunk_id = Column(BigInteger, primary_key=True)
    place = Column(String(255))
    condition = Column(String(255))
    weather = Column(String(255))

class ProcessLabelChunk(BasePostgresTraffic):
    __tablename__ = 'process_label_chunk'
    raw_id = Column(BigInteger())
    respondent_id = Column(BigInteger())
    t_time = Column(DateTime())
    info = Column(Text())
    respondent_name = Column(String(255))
    respondent_region_id = Column(Integer())
    t_user_id = Column(BigInteger())
    kind_id = Column(BigInteger())
    piece_id = Column(BigInteger, primary_key=True)
    place = Column(String(255))
    condition = Column(String(255))
    weather = Column(String(255))

class Regency(BasePostgresTraffic):
    __tablename__ = 'regencies'
    id = Column(BigInteger, primary_key=True)
    state_id = Column(Integer())
    hierarchy_id = Column(Integer())
    name = Column(String(255))
    alias = Column(String(255))
    lat = Column(Float())
    lng = Column(Float())
    active = Column(Boolean, default=True)

class RegencyRegion(BasePostgresTraffic):
    __tablename__ = 'regencies_regions'
    id = Column(Integer, primary_key=True)
    regency_id = Column(Integer())
    region_id = Column(Integer())
    active = Column(Boolean, default=True)

class Place(BasePostgresTraffic):
    __tablename__ = 'places'
    id = Column(BigInteger, primary_key=True)
    regency_id = Column(Integer())
    name = Column(String(255))
    lat = Column(Float())
    lng = Column(Float())
    active = Column(Boolean, default=True)

class Spot(BasePostgresTraffic):
    __tablename__ = 'spots'
    id = Column(BigInteger, primary_key=True)
    chunk_id = Column(BigInteger())
    raw_id = Column(BigInteger())
    place_id = Column(BigInteger())
    category_id = Column(Integer())
    weather_id = Column(Integer, default=1)
    active = Column(Boolean, default=True)
    verified = Column(Boolean, default=False)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    processed = Column(Boolean, default=False)
    score = Column(Float())

class Space(BasePostgresTraffic):
    __tablename__ = 'spaces'
    id = Column(BigInteger, primary_key=True)
    piece_id = Column(BigInteger())
    raw_id = Column(BigInteger())
    user_id = Column(BigInteger, default=3)
    place_id = Column(BigInteger())
    category_id = Column(Integer())
    weather_id = Column(Integer, default=1)
    active = Column(Boolean, default=True)
    trained = Column(Boolean, default=False)
    verified = Column(Boolean, default=False)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)

class Machine(BasePostgresTraffic):
    __tablename__ = 'machines'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    spot_id = Column(BigInteger())
    classification_id = Column(Integer())
    place_id = Column(BigInteger())
    category_id = Column(Integer())
    weather_id = Column(Integer())
    info = Column(Text())
    media = Column(String(255))
    active = Column(Boolean, default=True)
    verified = Column(Boolean, default=False)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    processed = Column(Boolean, default=False)

class Human(BasePostgresTraffic):
    __tablename__ = 'humans'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    space_id = Column(BigInteger())
    classification_id = Column(Integer())
    place_id = Column(BigInteger())
    category_id = Column(Integer())
    weather_id = Column(Integer())
    info = Column(Text())
    media = Column(String(255))
    active = Column(Boolean, default=True)
    trained = Column(Boolean, default=False)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)

class Marker(BasePostgresTraffic):
    __tablename__ = 'markers'
    id = Column(BigInteger, primary_key=True)
    raw_id = Column(BigInteger())
    user_id = Column(BigInteger())
    category_id = Column(Integer())
    weather_id = Column(Integer())
    respondent_id = Column(BigInteger())
    info = Column(Text())
    lat = Column(Float())
    lng = Column(Float())
    pinned = Column(Boolean, default=False)
    cleared = Column(Boolean, default=False)
    active = Column(Boolean, default=True)
    created = Column(DateTime(), default=datetime.now)
    modified = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    exported = Column(Boolean, default=False)

class ProcessMachining(BasePostgresTraffic):
    __tablename__ = 'process_machining'
    raw_id = Column(BigInteger())
    info = Column(String(255))
    media = Column(String(255))
    t_time = Column(DateTime())
    respondent_id = Column(BigInteger())
    respondent_name = Column(String(255))
    t_user_id = Column(BigInteger())
    kind_id = Column(BigInteger())
    classification_id = Column(Integer())
    classification_name = Column(String(255))
    place_id = Column(BigInteger())
    place_name = Column(String(255))
    category_id = Column(Integer())
    category_name = Column(String(255))
    weather_id = Column(Integer())
    weather_name = Column(String(255))
    spot_id = Column(BigInteger, primary_key=True)
    score = Column(Float())
    chunk_id = Column(BigInteger())
    place = Column(String(255))
    condition = Column(String(255))
    weather = Column(String(255))

class ProcessMarkering(BasePostgresTraffic):
    __tablename__ = 'process_markering'
    raw_id = Column(BigInteger())
    info = Column(String(255))
    media = Column(String(255))
    t_time = Column(DateTime())
    respondent_id = Column(BigInteger())
    respondent_name = Column(String(255))
    t_user_id = Column(BigInteger())
    classification_id = Column(Integer())
    classification_name = Column(String(255))
    place_id = Column(BigInteger())
    place_name = Column(String(255))
    lat = Column(Float())
    lng = Column(Float())
    category_id = Column(Integer())
    category_name = Column(String(255))
    weather_id = Column(Integer())
    weather_name = Column(String(255))
    spot_id = Column(BigInteger())
    score = Column(Float())
    user_id = Column(BigInteger(), default=3)
    username = Column(String(255))
    machine_id = Column(BigInteger, primary_key=True)

class ProcessMongoing(BasePostgresTraffic):
    __tablename__ = 'process_mongoing'
    raw_id = Column(BigInteger())
    tweet_text = Column(String(255))
    tweet_media = Column(String(255))
    tweet_time = Column(DateTime())
    tweet_id = Column(BigInteger())
    tweet_url = Column(String(255))
    respondent_id = Column(BigInteger())
    tweet_user_id = Column(BigInteger())
    tweet_user_screen_name = Column(String(255))
    tweet_official = Column(Boolean())
    respondent_active = Column(Boolean())
    respondent_tmc = Column(Boolean())
    respondent_region_id = Column(Integer())
    respondent_region_name = Column(String(255))
    respondent_name = Column(String(255))
    user_id = Column(BigInteger())
    user_email = Column(String(255))
    marker_id = Column(BigInteger, primary_key=True)
    marker_info = Column(String(255))
    marker_created = Column(DateTime())
    marker_lat = Column(Float())
    marker_lng = Column(Float())
    category_id = Column(Integer())
    category_name = Column(String(255))
    weather_id = Column(Integer())
    weather_name = Column(String(255))

class ProcessDistrict(BasePostgresTraffic):
    __tablename__ = 'process_district'
    district_id = Column(Integer, primary_key=True)
    district_name = Column(String(255))
    district_lat = Column(Float())
    district_lng = Column(Float())
    regency_id = Column(Integer())
    regency_name = Column(String(255))
    regency_alias = Column(String(255))
    regency_lat = Column(Float())
    regency_lng = Column(Float())
    state_id = Column(Integer())
    state_name = Column(String(255))
    hierarchy_id = Column(Integer())
    hierarchy_name = Column(String(255))
    regency_region_id = Column(Integer())
    region_id = Column(Integer())
    region_lat = Column(Float())
    region_lng = Column(Float())
    region_name = Column(String(255))
    region_description = Column(String(255))

class ProcessRegency(BasePostgresTraffic):
    __tablename__ = 'process_regency'
    regency_id = Column(Integer, primary_key=True)
    regency_name = Column(String(255))
    regency_alias = Column(String(255))
    regency_lat = Column(Float())
    regency_lng = Column(Float())
    state_id = Column(Integer())
    state_name = Column(String(255))
    hierarchy_id = Column(Integer())
    hierarchy_name = Column(String(255))
    regency_region_id = Column(Integer())
    region_id = Column(Integer())
    region_lat = Column(Float())
    region_lng = Column(Float())
    region_name = Column(String(255))
    region_description = Column(String(255))
