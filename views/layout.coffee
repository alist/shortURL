  head ->
    meta charset: 'utf-8'
    meta name:"viewport", content:"width=device-width, initial-scale=1.0, user-scalable = no"
    meta name: "apple-mobile-web-app-capable", content:"yes"
    #link href: "/css/bootstrap-responsive.css", rel: "stylesheet"
    
    title "#{@title or 'Untitled'} | alist"

    if @stylesheets
      for s in @stylesheets
        link rel: 'stylesheet', href: s + '.css'
    link(rel: 'stylesheet', href: @stylesheet + '.css') if @stylesheet
    style @style if @style
  
    if @localScripts
      for s in @localScripts
          script src: s + '.js'
 
  

  body ->
  
    @body

  body ->
    if @scripts
      for s in @scripts
          script src: s + '.js'
    

