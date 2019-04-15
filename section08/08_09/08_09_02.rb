# encoding: utf-8
# ===
# === 8.9.2 モジュールにほかのモジュールをincludeする
module A
  def hello
    puts "hello"
  end
end

module B
  # モジュールの中でモジュールをミックスインする
  include A

  def good_night
    puts "Good night!"
  end
end

class User
  include B
end

user = User.new
user.good_night

# 直接ミックスインしていないメソッドも呼び出せる
user.hello

# ancestorsメソッドを使っても呼び出された内容を出力できる
p User.ancestors #=> [User, B, A, Object, Kernel, BasicObject]
˝
