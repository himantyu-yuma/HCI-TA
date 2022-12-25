# coding: utf-8
require 'sqlite3'

db = SQLite3::Database.new("kadai.db")
lab = gets.chomp
db.execute("SELECT member_name FROM lab_members INNER JOIN labs ON lab_members.lab_id = labs.id WHERE labs.lab_name = ?", [lab]) do |row|
    puts row.join(",")
end
db.close