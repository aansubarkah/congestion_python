import tweepy

# Twitter Login
cKey = 'mJV21oC39057dyq8jjo3Kc83q'
cSecret = 'uvZJ5nwkrEpTcLGLouIHdggCGOzDHEmxyjrfL5g4QJHFxOXTPc'
aToken = '3517023912-MrK5vXAeXyXINZipV7Ztl7zoLtAFd3yo0GTY32u'
aSecret = 'srNCQFl2Rpz3SxAi0I5ovoVFHONbvCuB0Eebw6sc2NszF'

auth = tweepy.OAuthHandler(cKey, cSecret)
auth.set_access_token(aToken, aSecret)

api = tweepy.API(auth)
