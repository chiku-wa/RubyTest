#encoding: utf-8
# ===
# === 10.3.1 Procオブジェクトの基礎

# ブロックをオブジェクトにしたい場合は、Procクラスのnewメソッドにブロックを引数として渡す。
# 定義した時点では実行されない。
proc_echo = Proc.new { |text| puts text * 2 }

# もちろん、do〜endでも定義可能
proc_echo_upcase = Proc.new do |text|
  puts (text * 2).upcase
end

# ブロックの処理を実行したい場合は、Procクラスのcallメソッドを実行する
proc_echo.call("Hello!")
#=> Hello!Hello!

proc_echo_upcase.call("Hello!")
#=> HELLO!HELLO!

# 通常のメソッドのように、様々な引数を用いることもできる
# [デフォルト値付きの引数]
proc_calucuclator = Proc.new { |lhs = 0, rhs = 0| lhs + rhs }
puts proc_calucuclator.call(10) #=> 10

# [可変長引数]
proc_cat_msg = Proc.new { |*messages| messages.join(" ") }
puts proc_cat_msg.call(["Mornin", "Hello!", "Evening!"]) #=> Mornin Hello! Evening!

# Kernelクラスのprocメソッドでも、Proc.newと同じように振る舞うことができる
proc_shuffle = Kernel.proc { |text| text.chars.shuffle.join }
puts proc_shuffle.call("Tom") #=> oTm

# mainインスタンスはObjectクラスのインスタンスであり、ObjectクラスはKernelモジュールを
# includeしているため、procメソッドを使用することが可能。
p self.class #=> Object

proc_echo = proc { |text| text * 2 }
puts proc_echo.call("Hello!") #=> Hello!Hello!
