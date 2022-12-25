# coding: utf-8
require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter" =>"sqlite3",
    "database" => "./ARLesson.db"
)

class Student_record < ActiveRecord::Base
end

#student_id が 3 のデータを消去
p Student_record.find_by(:student_id=>3).destroy
p Student_record.all