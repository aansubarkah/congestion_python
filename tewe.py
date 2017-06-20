#!/usr/bin/env python
import tweepy

# Twitter Login Macet Surabaya
MCcKey = 'mJV21oC39057dyq8jjo3Kc83q'
MCcSecret = 'uvZJ5nwkrEpTcLGLouIHdggCGOzDHEmxyjrfL5g4QJHFxOXTPc'
MCaToken = '3517023912-MrK5vXAeXyXINZipV7Ztl7zoLtAFd3yo0GTY32u'
MCaSecret = 'srNCQFl2Rpz3SxAi0I5ovoVFHONbvCuB0Eebw6sc2NszF'

# Twitter Login Dimana Macet
DMcKey = 'jWMUtq7VXzqRbYbqHSe4QkQMe'
DMcSecret = 'W0qMx2jt8qlZo5OOk6yowMG6gLf2w839P3iACwz19dFt0BjSCs'
DMaToken = '3555146480-8DzpAwHoQvPXlHGqUOWebDyK4DJmwVdQTc8Tx8V'
DMaSecret = 'qah9D2AvRuN4l9jUuInjoXo9ZTqnY3DiU6u5u1dD8X5Tb'

auth = tweepy.OAuthHandler(MCcKey, MCcSecret)
auth.set_access_token(MCaToken, MCaSecret)

api = tweepy.API(auth)
