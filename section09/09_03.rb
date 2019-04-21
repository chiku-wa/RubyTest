# encoding: utf-8
# ===
# === 9.3 意図的に例外を発生させる

begin
  # raiseで意図的にNoMethodErrorを発生させる
  raise NoMethodError, "意図的にNoMethodErrorを発生させる"

  # インスタンスを渡すこともできる、その場合はnewメソッドの引数にメッセージを渡すこと
  # raise NoMethodError.new("意図的にNoMethodErrorを発生させる")
rescue => e
  puts "#{e.class} [#{e.message}]"
end
#=> NoMethodError [意図的にNoMethodErrorを発生させる]

# クラス名を省略した場合はRuntimeErrorとなる
begin
  # メッセージ引数のみ渡し、クラス名は省略
  raise "引数を省略するとRuntimeError"

  # もちろん、メッセージのみ省略することも可能
  # raise NoMethodError
rescue => e
  puts "#{e.class} [#{e.message}]"
end
#=> RuntimeError [引数を省略するとRuntimeError]
