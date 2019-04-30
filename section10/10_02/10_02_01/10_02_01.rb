#encoding: utf-8
def greeting
  puts "おはよう"
end

# ===
# === メソッドでyieldを定義する
# まずは通常の方法でメソッドを呼び出す
greeting
#=> おはよう

# ブロックを渡しても、返ってくる結果は変わらない
greeting { puts "こんにちは" }
#=> おはよう

undef greeting
puts "==================-"

# yieldを定義すると、メソッドに渡されたブロックを呼び出す
def greeting
  puts "おはよう"
  yield # 渡されたブロックをここで呼び出す
  puts "こんばんわ"
end

greeting { puts "こんにちは"; puts "Hello" }
#=>
# おはよう
# こんにちは
# Hello
# こんばんは

# メソッドにyieldが定義されている場合、呼び出し時にブロックを渡さないとエラーになる
# greeting #=> `greeting': no block given (yield) (LocalJumpError)

undef greeting
puts "==================-"

# blocj_given?メソッドを使うことで、ブロックを渡されたかどうかを判定できる。
def greeting
  puts "おはよう"
  # ブロックを渡された場合のみyieldでブロックを処理する
  if block_given?
    yield
  end
  puts "こんばんわ"
end

greeting { puts "こんにちは" }
#=>
# おはよう
# こんにちは
# こんばんは

puts "---"
# ブロックなしでもエラー無しで呼び出せる
greeting
#=>
# おはよう
# こんばんは

undef greeting
puts "==================-"

# ===
# === yieldの結果を格納する

# yieldを使って、ブロックに値を渡す
def greeting
  puts "おはよう"
  if block_given?
    # ブロックに値をわたして結果を受け取る
    text = yield "こんにちは"
    puts text
  end
  puts "こんばんわ"
end

greeting do |text|
  # 受け取った変数に「!!!」を付与する
  "#{text}!!!"
end
#=>
# おはよう
# こんにちは!!!
# こんばんわ

undef greeting
puts "==================-"

# yieldにわたす引数は、ブロックで受け取る引数の個数と異なっていてもエラーにならない

# [1]yiledで綿数引数 > ブロックの引数
def greeting
  puts "おはよう"
  text = yield "こんにちは", "Hello" # yieldでブロックに渡す引数は2
  puts "こんばんわ"
end

greeting do |text| # ブロックの引数は1
  puts "#{text}!!!"
end
#=>
# おはよう
# こんにちは!!!
# こんばんわ

undef greeting
puts "---"

# [2]yiledで綿数引数 < ブロックの引数
def greeting
  puts "おはよう"
  text = yield "こんにちは" # yieldでブロックに渡す引数は1
  puts "こんばんわ"
end

greeting do |text, foo|
  # 2つめの引数はnilになる
  # inspectメソッド…pメソッドが内部的に呼び出している、オブジェクトの内容をそのまま取得するメソッド
  puts "#{text}!!! #{foo.inspect}"
end
# おはよう
# こんにちは!!! nil
# こんばんわ
