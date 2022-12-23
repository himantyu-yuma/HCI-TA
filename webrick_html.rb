require 'webrick'
srv = WEBrick::HTTPServer.new({
    :DocumentRoot => './',
    :BindAddress => '0.0.0.0',
    :Port => 2000
})
srv.mount('/test', WEBrick::HTTPServlet::FileHandler, 'test.html')
trap("INT"){ srv.shutdown }
srv.start