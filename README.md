shortURL
========

unit tested url-shortening framework operating with zappa js and mongo-db with mongoose

pre-reqs:
zappa, or some coffee-script compiling software built ontop of express js
mongoose used as adaptor for mongodb
secrets.coffee file kept in root of directory, with connection info within exports.mongoDBConnectURLSecret

setup:
in your main coffeescript file, eg appname.coffee, import short url:
shorturl = require('./routes/shorturl')

to support generation of short-urls by website users, add the following anywhere as route:
  @get '/shorten/*', shorturl.shorten

add the following before your catch-all (eg, 404) route:
  @get '/*', shorturl.unShortenRedir

tests:
tests were done with mocha using should expressive assertions
