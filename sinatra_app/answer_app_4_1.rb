# coding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'kadai.db'
)

class LabMember < ActiveRecord::Base
end

class Lab < ActiveRecord::Base
end

get '/' do
    @title = 'Hello, world!'
    @world = 'world!'
    erb :index
end

post '/lab_search' do
    @title = 'Lab Search View'
    @members = LabMember.all
    erb :seiseki
end

post '/member_serach' do
    @title = 'Member Search View'
    @members = LabMember.all
end


# bundle exec ruby app.rb -o 0.0.0.0 のオプションでホストからも確認できる
