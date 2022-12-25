# coding: utf-8
require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter" =>"sqlite3",
    "database" => "./ARLesson.db"
    )
class Student_record < ActiveRecord::Base
end

#student_id が 1 のデータを取り出し
student_1 = Student_record.find_by(:student_id=>1)
#.update(:カラム名 => 更新後のデータ) で更新
student_1.update(:grade=>' 秀')
