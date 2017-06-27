#!/usr/bin/env python
from CongestionMining import main as mining
from CongestionClassifying import main as classifying
from CongestionTagging import main as tagging
from CongestionLocating import main as locating
from CongestionSpoting import main as spoting
from CongestionMachining import main as machining
from CongestionMarkering import main as markering
from CongestionMongoing import main as mongoing
from CongestionTweeting import main as tweeting

if __name__ == '__main__':
    mining()
    classifying()
    tagging()
    locating()
    spoting()
    machining()
    markering()
    mongoing()
    #tweeting()
