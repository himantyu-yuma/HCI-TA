# coding: utf-8

require "cgi"
require 'sqlite3'

cgi = CGI.new
db = SQLite3::Database.new("kadai.db")

cgi.out("type" => "text/html",
    "charset" => "UTF-8") do
    msg = cgi["message"]
    iteration = cgi["iter"].to_i
    html = "<html><body>"

    db.execute("SELECT lab_id FROM lab_members WHERE member_name = ?", [cgi["search_name"]]) do |row|
        db.execute("SELECT member_name FROM lab_members WHERE lab_id = ?", [row[0]]) do |name|
            if name[0] != search_name
                html = html + "<p>#{name[0]}</p>"
            end
        end
        break
    end

    db.close
    html = html + "</body></html>"
    html
end