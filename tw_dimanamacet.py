import tweepy

# Twitter Login
cKey = 'jWMUtq7VXzqRbYbqHSe4QkQMe'
cSecret = 'W0qMx2jt8qlZo5OOk6yowMG6gLf2w839P3iACwz19dFt0BjSCs'
aToken = '3555146480-8DzpAwHoQvPXlHGqUOWebDyK4DJmwVdQTc8Tx8V'
aSecret = 'qah9D2AvRuN4l9jUuInjoXo9ZTqnY3DiU6u5u1dD8X5Tb'

auth = tweepy.OAuthHandler(cKey, cSecret)
auth.set_access_token(aToken, aSecret)

api = tweepy.API(auth)
