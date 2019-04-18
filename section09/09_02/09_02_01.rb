# encoding: utf-8
# ===
# === 9.2.1 発生した例外を補足しない場合
module Loggable
  def log
  end
end

# インスタンスは生成できないため、newメソッドが存在しない旨のエラーが発生する
loggable = Loggable.new
#=> 〜/section09/09_02/09_02_01.rb:10:in undefined method `new' for Loggable:Module (NoMethodError)

# ↑でエラーが発生するとそこでプログラムが終了するため、以下の出力は行われない
puts "End of file"
