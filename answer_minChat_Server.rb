# coding: utf-8
require 'socket'

server = TCPServer.new 2000

client = server.accept

loop do
    msg = client.gets.chomp
    if msg != "bye"
        puts msg
    else
        client.close
        break
    end
end