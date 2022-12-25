# coding: utf-8
require 'sqlite3'

db = SQLite3::Database.new("sandbox.db")
grade = gets.chomp
db.execute("SELECT student_id, klass FROM student_records WHERE grade = ?",[grade]) do |row|
    puts row.join(",")
end
db.close