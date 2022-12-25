require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html",
    "charset" => "UTF-8") do
    iter = cgi["num"].to_i
    html = "<html><body>"
    iter.times do |i|
        if (i+1)%3==0 and (i+1)%5==0
            html = html + "<p>FizzBuzz</p>"
        elsif (i+1)%3==0
            html = html + "<p>Fizz</p>"
        elsif (i+1)%5==0
            html = html + "<p>Buzz</p>"
        else
            html = html + "<p>#{i+1}</p>"
        end
    end
    html = html + "</body></html>"
    html
end