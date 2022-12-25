# coding: utf-8
require 'active_record'

ActiveRecord::Base.establish_connection(
    "adapter" =>"sqlite3",
    "database" => "./ARLesson.db"
)

#ruby のクラスと DB 内のテーブルを結びつける (テーブル名の単数形をクラス名とする)
class Student_record < ActiveRecord::Base
end

#データを追加
Student_record.create(:student_id=> 1, :klass=>"情報理工学実験", :score=>90, :grade=>"不可")
Student_record.create(:student_id=> 2, :klass=>"情報理工学実験", :score=>70, :grade=>"良")
Student_record.create(:student_id=> 3, :klass=>"情報理工学実験", :score=>100, :grade=>"良")

#データの表示方法
puts '---全データを表示---'
p Student_record.all
puts '---:score の値が一番大きいデータを表示---'
p Student_record.order(score:"DESC").first
puts '---特定のデータを 1 つだけ表示---'
# 複数条件をつけると，AND で連結されます
p Student_record.find_by(:klass=>'情報理工学実験', :student_id => 1) #.find_by(:カラム名=>データ)
puts '---特定のデータを全て表示---'
p Student_record.where(:grade=>' 良') #.where(:カラム名 => データ)✒ ✑ 上記のように，ActiveRecord は ruby のクラス名によっ