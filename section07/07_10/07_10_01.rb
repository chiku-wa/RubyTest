#encoding: utf-8
# ===
# === 7.10.1 エイリアスメソッドの定義
class User
  def hello
    puts "Hello!"
  end

  # helloメソッドをgreetingで呼び出せるようにする
  # エイリアスは、対象となるメソッドを定義したあとでないとエラーになる
  alias greeting hello
end

user = User.new
puts user.hello #=> Hello!
puts user.greeting #=> Hello!
