require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html",
    "charset" => "UTF-8") do
    html = "<html><body>"
    File.open("db.txt", "r") do |f|
        f.each_line{ |line|
            html = html + "<p>id:#{line.split("")[0]}</p>"
        }
    end
    html = html + "</body></html>"
    html
end