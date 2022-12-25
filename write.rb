require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html",
    "charset" => "UTF-8") do
    msg = cgi["msg"]
    line_count = 1
    File.open("db.txt", "r") do |f|
        while f.gets
            line_count += 1
        end
    end
    File.open("db.txt", "a") do |f|
        f.puts("#{line_count}:#{msg}")
    end

    html = "<html><body></body></html>"
    html
end