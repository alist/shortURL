secrets = require ('./secrets')
request = require 'request'

shorturl = require('./routes/shorturl')
home = require('./routes/home')

mongoose = require('mongoose')
Schema = mongoose.Schema


`Array.prototype.unique = function() {    var o = {}, i, l = this.length, r = [];    for(i=0; i<l;i+=1) o[this[i]] = this[i];    for(i in o) r.push(o[i]);    return r;};`

shortApp = require('zappa').app ->
  mongoose.connect(secrets.mongoDBConnectURLSecret)
  @use 'bodyParser', 'static', 'cookies', 'cookieParser', session: {secret: 'secrets'}

  crypto = require('crypto')
 
  @get '/', home.home

  @get '/shorten/*', shorturl.shorten

  @get '/*', shorturl.unShortenRedir

  @get '*', (req, res)->
    @redirect '/'
  
 
port = if process.env.PORT > 0 then process.env.PORT else 3000
shortApp.app.listen port
