# coding: utf-8
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'seiseki.db'
)

class StudentRecord < ActiveRecord::Base
end

class Student < ActiveRecord::Base
end

get '/' do
    @title = 'Hello, world!'
    @world = 'world!'
    erb :index
end

get '/seiseki' do
    @title = 'Seiseki View'
    @students = StudentRecord.all
    erb :seiseki
end

post '/judge' do
    if !Student.where(:student_id => params[:student_id], :name => params[:name]).empty?
        @title = 'View Seiseki'
        @student = StudentRecord.where(:student_id => params[:student_id])
        @student_name = params[:name]
        erb :login
    else
        redirect '/'
    end
end


# bundle exec ruby app.rb -o 0.0.0.0 のオプションでホストからも確認できる
