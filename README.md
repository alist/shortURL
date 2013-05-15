shortURL
========

unit tested url-shortening framework operating with zappa js and mongo-db with mongoose
reliably creates "shortURICodes" from "redirectURIs"

structure:
* application uses /routes/shorturl.coffee to handle /shorten and /* (unshorten) requests
* /routes/shorturl.coffee calls /model/shorturl.coffee to handle shorten and retrieve

interface for shorturl.shorten (/model/shorturl.coffee):  

    shorturl.shorten = (shorteningURI, minLength, domain, shouldReuseCode, customCode, userInfo, callback) -> #callback(err, shortURL<object>)  
    shorteningURI - url to shorten  
    minLength - min short-code length, length may be longer if too many intersections happen on generation  
    domain - callback will error if shorteningURI does not begin with domain string   
    shouldReuseCode - callback will return old code for same shorteningURI if the prior code wasn't a "customCode"  
    customCode - a custom code for the short-code, callback will error if the code is used   
    userInfo - any data you want to include about the user shortening the uri   
    callback - passes (err, and shortURL)   
    -- err - error if shortening failed   
    -- shortURL - an object containing 'shortURICode' and 'redirectURI' properties, among others (see /model/shorturl.coffee)  

interface for shorturl.retrieve:

    shorturl.retrieve = (shortURICode, userInfo, callback) -> #callback(err, shortURL)
    shortURICode - short code that corresponds to redirectURI which you've already shortened
    userInfo - any data you want to include about the user retrieving the uri   
    callback - passes (err, and shortURL)   
    -- err - error if shortening failed   
    -- shortURL - an object containing 'shortURICode' and 'redirectURI' properties, among others (see /model/shorturl.coffee)  

pre-reqs:  
* zappa, or some coffee-script compiling software built ontop of express js
* mongoose used as adaptor for mongodb
* secrets.coffee file kept in root of directory, with connection info within exports.mongoDBConnectURLSecret

setup:   
1. in your main coffeescript file, eg appname.coffee, import short url:
     shorturl = require('./routes/shorturl')

2. to support generation of short-urls by website users, add the following anywhere as route:
     @get '/shorten/*', shorturl.shorten

3. add the following before your catch-all (eg, 404) route:
      @get '/*', shorturl.unShortenRedir

to use:  

    coffee short.coffee, or supervisor short.coffee
    then go to
    localhost:3000/shorten/urltoshorten
    then aftwards, you're able to go to localhost:3000/code to redirect

tests:
* tests were done with mocha using should expressive assertions
* find the test at /test/

