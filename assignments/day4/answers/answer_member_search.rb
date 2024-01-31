# coding: utf-8
require 'sqlite3'

db = SQLite3::Database.new("kadai.db")
search_name = gets.chomp

db.execute("SELECT lab_id FROM lab_members WHERE member_name = ?", [search_name]) do |row|
    db.execute("SELECT member_name FROM lab_members WHERE lab_id = ?", [row[0]]) do |name|
        if name[0] != search_name
            p name[0]
        end
    end
    break
end
db.close