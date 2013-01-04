@title = 'I am'
@stylesheets = ['/css/style','/css/bootstrap.min']
@localScripts = ['/js/jquery.min','/js/bootstrap']

fbAppID = ''
body ->


div "bg-container", style: "background: url('#{@backgroundImage}') no-repeat center center fixed; -webkit-background-size: cover;moz-background-size: cover;-o-background-size: cover;-webkit-background-size: cover;-moz-background-size: cover;background-size: cover;", ->
  ###  div 'contentHeader', ->
    div 'container-fluid', ->
      p 'contentHeaderText', -> "Alexander Hoekje List" ###
  div 'contentHeaderText', -> 'ShortURL by Alexander Hoekje List'
  a href: 'http://github.com/alist/shorturl', "ShortURL on github"
  p 'Shorten by appending url to /shorten/'
  
