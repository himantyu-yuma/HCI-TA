# coding: utf-8
require 'socket'

socket = TCPSocket.new('127.0.0.1', 2000)
puts socket.gets
socket.puts 'Hello, server'
socket.close