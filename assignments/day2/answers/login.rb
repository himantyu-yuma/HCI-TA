require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html",
    "charset" => "UTF-8") do

    password = cgi["password"]
    is_match = false

    File.open("List.txt", "r") do |f|
        f.each_line{ |line|
            is_match = is_match || (line.chomp == password)
        }
    end
    html = "<html><body>"

    if is_match
        html = html + "<p>Success!</p></body></html>"
    else
        html = html + "<p>Failure...</p></body></html>"
    end
    html
end