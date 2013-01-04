shortURL
========

unit tested url-shortening framework operating with zappa js and mongo-db with mongoose

pre-reqs:
*zappa, or some coffee-script compiling software built ontop of express js
*mongoose used as adaptor for mongodb
*secrets.coffee file kept in root of directory, with connection info within exports.mongoDBConnectURLSecret

setup:
1) in your main coffeescript file, eg appname.coffee, import short url:
  shorturl = require('./routes/shorturl')

2) to support generation of short-urls by website users, add the following anywhere as route:
  @get '/shorten/*', shorturl.shorten

3) add the following before your catch-all (eg, 404) route:
  @get '/*', shorturl.unShortenRedir

to use go to
localhost:3000/shorten/urltoshorten
then aftwards, you're able to go to localhost:3000/code to redirect

tests:
*tests were done with mocha using should expressive assertions
