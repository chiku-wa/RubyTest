# encoding: utf-8
# ===
# === 8.3.2 モジュールをextendする
module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

class Product
  extend Loggable

  # クラスメソッド
  def self.format_name(name)
    # クラスメソッドの中で呼び出されるメソッドはクラスメソッドとなる
    log "name is called"
    "My name is #{name}"
  end
end

# クラスメソッド経由でモジュールが呼び出される
puts Product.format_name("Bob") #=> My name is Bob

# クラスメソッドとして直接logメソッドを呼び出せる
Product.log "Out of class" #=> [LOG]Out of class

class User
  extend Loggable

  # クラス直下でクラスメソッドとして呼び出すことが可能
  # クラスを定義した段階で呼び出される
  log "Directly under class"
end

#=> [LOG]Directly under class
