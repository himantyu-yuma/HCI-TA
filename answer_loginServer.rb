require 'webrick'
CGI_PATH = '/usr/local/bin/ruby'

srv = WEBrick::HTTPServer.new({
    :DocumentRoot => './',
    :BindAddress => '0.0.0.0',
    :Port => 2000,
    :CGIInterpreter => CGI_PATH
})
srv.mount('/', WEBrick::HTTPServlet::FileHandler, 'login.html')
srv.mount('/login', WEBrick::HTTPServlet::CGIHandler, 'login.rb')
trap("INT"){ srv.shutdown }
srv.start