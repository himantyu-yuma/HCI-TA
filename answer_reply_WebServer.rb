require 'webrick'
CGI_PATH = '/usr/local/bin/ruby'

srv = WEBrick::HTTPServer.new({
    :DocumentRoot => './',
    :BindAddress => '0.0.0.0',
    :Port => 2000,
    :CGIInterpreter => CGI_PATH
})
srv.mount('/time', WEBrick::HTTPServlet::CGIHandler, 'time.rb')
srv.mount('/fizzbuzz', WEBrick::HTTPServlet::CGIHandler, 'fizzbuzz.rb')
trap("INT"){ srv.shutdown }
srv.start