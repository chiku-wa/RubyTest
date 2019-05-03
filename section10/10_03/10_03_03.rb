#encoding: utf-8
# ===
# === 10.3.3 Procオブジェクトを普通の引数として渡す

# メソッドで「&」を付けなければ、Procインスタンスをそのまま受け取ることができる
def greeting(proc_echo)
  puts "Mornin!"
  puts proc_echo.call("Hello!")
  puts "Evening!"
end

proc_echo = proc { |text| text * 2 }
greeting(proc_echo)
#=>
# Mornin!
# Hello!Hello!
# Evening!

# 引数をオブジェクトとして渡すことで、1つのメソッドに複数のブロックを渡すことができる(&付きでない)
undef greeting

def greeting(proc1, proc2, proc3)
  puts proc1.call("Mornin!")
  puts proc2.call("Hello!!")
  puts proc3.call("Evening!")
end

proc1 = proc { |text| text * 2 }
proc2 = proc { |text| text * 3 }
proc3 = proc { |text| text * 4 }

greeting(proc1, proc2, proc3)
#=>
#  Mornin!Mornin!
# Hello!!Hello!!Hello!!
# Evening!Evening!Evening!Evening!
