# encoding: utf-8
# ===
# === 9.2.2 例外を補足して処理を続行する場合
puts "Start"

module Loggable
  def log(text)
    "[LOG]#{text}"
  end
end

# 例外発生時はputsしてそのまま処理を継続する
begin
  loggable = Loggable.new
rescue
  puts "例外が発生したが、処理は継続する"
end

puts "End"

# 以下の出力となる
#=>
# Start
# 例外が発生したが、処理は継続する
# End

# とはいえここで紹介したプログラムは本来好ましくない。後述の章で詳しく説明していく。
