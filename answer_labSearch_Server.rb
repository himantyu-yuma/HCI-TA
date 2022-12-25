require 'webrick'
require 'sqlite3'
CGI_PATH = '/usr/local/bin/ruby'

srv = WEBrick::HTTPServer.new({
    :DocumentRoot => './',
    :BindAddress => '0.0.0.0',
    :Port => 2000,
    :CGIInterpreter => CGI_PATH
})
srv.mount('/lab_search', WEBrick::HTTPServlet::CGIHandler, 'lab_search.rb')
srv.mount('/member_search', WEBrick::HTTPServlet::CGIHandler, 'member_search.rb')
trap("INT"){ srv.shutdown }
srv.start