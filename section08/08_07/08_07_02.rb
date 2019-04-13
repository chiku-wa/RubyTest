# encoding: utf-8
# ===
# === 8.7.2 module_functionメソッド
module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end

  # ↑で定義したメソッドをmodule_functionで指定する
  # 【注意】メソッドが定義された状態でないと指定できない
  module_function :log

  # module_functionの対象外のメソッド
  def format_method_name(method_name)
    "Method name:#{method_name}"
  end

  module_function
  # ここから下に定義したメソッドはすべてmodule_functionの対象となる
  def format_date(date)
    "Date:#{date}"
  end
end

# 特異メソッドとして呼び出す
Loggable.log("Call singular method") #=> [LOG]Call singular method
puts Loggable.format_date("2019/4/13") #=> Date:2019/4/13

# module_function対象外のメソッドは呼び出せない
# Loggable.format_method_name("format_method_name") #=> undefined method `format_method_name' for Loggable:Module (NoMethodError)

# クラスにミックスインして使用する
class User
  include Loggable

  def initialize(name, is_login = false)
    @name = name
    @is_login = is_login
  end

  def login
    is_login = true
    # ミックスインしたメソッドを呼び出し
    log "#{@name} is login."
  end
end

user = User.new("Tom")
user.login #=> [LOG]Tom is login

# module_functionの対象となったメソッドはprivateメソッドとなるため、外からは呼び出せない
# user.log "Call from outside" #=> private method `log' called for #<User:0x00007f8bb889bf98 @name="Tom", @is_login=false> (NoMethodError)
