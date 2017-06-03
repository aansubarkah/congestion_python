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

