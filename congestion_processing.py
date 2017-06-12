#!/usr/bin/env python
from CongestionMining import main as mining
from CongestionClassifying import main as classifying
from CongestionTagging import main as tagging
from CongestionLocating import main as locating

if __name__ == '__main__':
    mining()
    classifying()
    tagging()
    locating()
