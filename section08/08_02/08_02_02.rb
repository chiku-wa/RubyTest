# encoding: utf-8
# ===
# === 8.2.2 モジュールの定義

# Greeter→「挨拶する人」という意味
module Greeter
  def hello
    "hello"
  end
end

# モジュールはインスタンスを作成することはできない
# greeter = Greeter.new #=> undefined method `new' for Greeter:Module (NoMethodError)

# モジュールはクラスのように継承する事はできない
# module AwesomeGreeter < Greeter
# end
#=> syntax error, unexpected '<'
#   module AwesomeGreeter < Greeter
