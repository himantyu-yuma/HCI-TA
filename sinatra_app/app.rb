# coding: utf-8

require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: 'laboratory.db',
)

class Lab < ActiveRecord::Base
end

class LabMember < ActiveRecord::Base
end

get '/' do
    erb :index
end

post '/lab_search' do
    @title = 'Lab Search'
    lab_name = params["lab_name"]
    lab_id = Lab.where(:lab_name => lab_name)
                .select(:id)
    @members = LabMember.where(:lab_id => lab_id)
                        .select(:member_name)
    if @members.empty?
        @error_message = "研究室名：#{lab_name}は存在しません．"
    end
    erb :lab_search
end

post '/member_search' do
    @title = 'Member Search'
    member_name = params["member_name"]
    lab_id = LabMember.where(:member_name => member_name)
                      .select(:lab_id)
    @members = LabMember.where(:lab_id => lab_id)
                        .where.not(:member_name => member_name)
                        .select(:member_name)
    if @members.empty?
        @error_message = "メンバー名：#{member_name}は存在しません"
    end
    erb :member_search
end