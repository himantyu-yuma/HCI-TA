require 'webrick'

srv = WEBrick::HTTPServer.new({
    DocumentRoot: './',
    BindAddress: '0.0.0.0',
    Port: 2000,
})
srv.mount('/hoge', WEBrick::HTTPServlet::FileHandler, 'hoge.txt')
trap("INT"){ srv.shutdown }
srv.start