# coding: utf-8
require 'sqlite3'

db = SQLite3::Database.new("sandbox.db")
db.execute("SELECT * FROM students") do |row|
    puts row.join(",")
end
db.close