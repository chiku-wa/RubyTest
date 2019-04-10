# encoding: utf-8
# ===
# === 8.5.9 オブジェクトに直接ミックスインする

# オブジェクトにextendするモジュールを定義
module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

# nameオブジェクトはnameメソッドを持たないためエラーになる
name = "Tom"
# name.log #=>undefined method `log' for "Tom":String (NoMethodError)

# nameオブジェクトにLoggableモジュールをextendする
name.extend(Loggable)

name.log("Output name.") #=> [LOG]Output ˝name.
