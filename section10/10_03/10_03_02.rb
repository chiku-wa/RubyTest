#encoding: utf-8
# ===
# === 10.3.2 Procオブジェクトをブロックの代わりに渡す

# 10.2で紹介したブロック引数は、実体はProcインスタンス
def greeting(&block)
  puts "おはよう"
  puts block.class  #=> Proc
  puts block.call("こんにちは")
  puts "こんばんわ"
end

greeting { |text| text * 2 }
#=>
# おはよう
# Proc
# こんにちはこんにちは
# こんばんわ

# Procインスタンスを生成してそれをメソッドに渡すことも可能
def greeting_en(&block)
  puts "Mornin!"
  puts block.call("Hello!")
  puts "Evening!"
end

proc_echo = proc { |text| text * 2 }

greeting_en(&proc_echo)
#=>
# Mornin!
# Hello!Hello!
# Evening!

# Procインスタンスを引数として渡す場合は先頭に「&」を付与する必要がある。
# 「10.2.2 ブロックを引数として明示的に受け取る」と同様に、通常の引数と同様に認識されてしまう。
greeting_en(proc_echo)
#=>  wrong number of arguments (given 1, expected 0) (ArgumentError)
