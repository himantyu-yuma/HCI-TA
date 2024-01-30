# coding: utf-8
require 'socket'

socket = TCPSocket.new('127.0.0.1', 2000)

loop do
    msg = gets().chomp
    socket.puts msg

    if msg == "bye"
        socket.close
        break
    end
end