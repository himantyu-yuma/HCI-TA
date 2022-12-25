require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html",
    "charset" => "UTF-8") do
    id=cgi["id"]
    html = "<html><body>"
    File.open("db.txt", "r") do |f|
        f.each_line{ |line|
            if(line.split("")[0] == id)
                html = html + "<p>#{line.split(":")[1]}</p>"
            end
        }
    end
    html = html + "</body></html>"
    html
end