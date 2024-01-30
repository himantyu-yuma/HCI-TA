require "cgi"
cgi = CGI.new

cgi.out("type" => "text/html",
    "charset" => "UTF-8") do
    msg = cgi["message"]
    iteration = cgi["iter"].to_i
    html = "<html><body><h1>#{Time.now}</h1></body></html>"
    html
end