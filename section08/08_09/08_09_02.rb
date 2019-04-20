# encoding: utf-8
# ===
# === 8.9.2 モジュールにほかのモジュールをincludeする
module A
  PREFIX = "[Greeting]"

  def hello
    puts "#{PREFIX}hello"
  end
end

module B
  # モジュールの中でモジュールをミックスインする
  include A

  def good_night
    puts "#{PREFIX}Good night!"
  end
end

class User
  include B
end

user = User.new
user.good_night #=> [Greeting]Good night!

# 直接ミックスインしていないメソッドや定数も呼び出せる
user.hello #=> [Greeting]hello

# ancestorsメソッドを使っても呼び出された内容を出力できる
p User.ancestors #=> [User, B, A, Object, Kernel, BasicObject]
