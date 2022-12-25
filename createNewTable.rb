# coding: utf-8
require 'active_record'

#DB と接続するためのメソッド
ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",  #adapter の指定 : mysql なども入っていれば設定可能
    "database" => "./ARLesson.db" #databese の指定 : ARLesson.db にアクセス可能となる
)

#新たなテーブル，student_records を作成
ActiveRecord::Migration.create_table :student_records do |t|
    t.integer :student_id #カラムの名前と型を指定 ( t. 型名 :カラム名)
    t.text :klass
    t.integer :score
    t.text :grade
end