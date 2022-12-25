# coding: utf-8
require 'socket'

server = TCPServer.new 2000

client = server.accept

client.puts 'Hello, client'
puts client.gets
client.close