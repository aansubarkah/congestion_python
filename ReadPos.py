#!/usr/bin/env python
from os import listdir
from os.path import isfile, join
import os

mypath = '/home/aan/congestion/pos/'
for f in listdir(mypath):
    if isfile(join(mypath, f)):
        if f.endswith('ol_cd.pos'):
            number = 0
            with open(join(mypath, f)) as f:
                for line in f:
                    if not line.strip():
                        number += 1
print('Banyak Baris Nopol', number)
for f in listdir(mypath):
    if isfile(join(mypath, f)):
        if f.endswith('e_cd.pos'):
            number = 0
            with open(join(mypath, f)) as f:
                for line in f:
                    if not line.strip():
                        number += 1
print('Banyak Baris Time', number)
number = 0
for f in listdir(mypath):
    if isfile(join(mypath, f)):
        if f.startswith('place_name'):
            with open(join(mypath, f)) as f:
                for line in f:
                    if not line.strip():
                        number += 1
print('Banyak Baris Place', number)
