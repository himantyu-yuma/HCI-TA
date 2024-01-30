require 'webrick'
CGI_PATH = '/usr/local/bin/ruby'

srv = WEBrick::HTTPServer.new({
    :DocumentRoot => './',
    :BindAddress => '0.0.0.0',
    :Port => 2000,
    :CGIInterpreter => CGI_PATH
})
srv.mount('/write', WEBrick::HTTPServlet::CGIHandler, 'write.rb')
srv.mount('/index', WEBrick::HTTPServlet::CGIHandler, 'index.rb')
srv.mount('/read', WEBrick::HTTPServlet::CGIHandler, 'read.rb')

trap("INT"){ srv.shutdown }
srv.start