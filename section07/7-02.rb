#encoding: utf-8
require_relative "./lib/User.rb"

# あらかいめ定義したUserオブジェクトを使用して、姓名を返すメソッドを定義する
def section_07_02_01
  users = []
  users << User.new("Alice", "Ruby", "20")
  users << User.new("Tom", "Python", "32")

  users.each do |user|
    p user.full_name
  end
  #=> Alice Ruby
  #=> Tom Ruby
end

section_07_02

def section_07_02_02
  #クラスやレシーバーといった用語の説明はQuiverに譲る
end
