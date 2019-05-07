#encoding: utf-8
# ===
# === 10.2.2 ブロックを引数として明示的に受け取る

# ---
# --- 「&」付きの引数とcallメソッド
# [構文]
# def メソッド名(&引数)
#   # ブロックを実行する
#   # 呼び出すときには「&」をつけない
#   引数.call
# end
def greeting(&block)
  puts "おはよう"
  puts block.call("こんにちは")
  puts "こんばんわ"
end

greeting do |text|
  "#{text}!!!"
end
#=>
# おはよう
# こんにちは!!!
# こんばんわ

undef greeting
puts "========================"

# ブロック引数を渡されたかどうかは、nilかどうかで判断できる
def greeting(&block)
  puts "おはよう"
  puts "Block argument is [#{block.inspect}]"
  unless block.nil?
    puts block.call("こんにちは")
  end
  puts "こんばんわ"
end

# ブロックを渡した場合
greeting do |text|
  "#{text}!!!"
end
#=>
# おはよう
# Block argument is [#<Proc:0x00007fe94d8419d8@〜/section10/10_02/10_02_02.rb:38>]
# こんにちは!!!
# こんばんわ
puts "----"

# ブロックを渡さなかった場合
greeting
#=>
# おはよう
# Block argument is [nil]
# こんばんわ

undef greeting
puts "========================"

# ブロック引数を使わないときと同様に、yieldとblock_given?を使用することも可能。
def greeting(&block)
  puts "おはよう"
  if block_given?
    puts yield("こんにちは")
  end
  puts "こんばんわ"
end

# ブロックなし
greeting
#=>
#  おはよう
#  こんばんわ

puts "----"

# ブロックあり
greeting do |text|
  "#{text}!!!"
end
# おはよう
# こんにちは!!!
# こんばんわ

puts "==========="

# ---
# --- ブロック引数を用いるメリット

# --- 1. ブロックを他のメソッドに渡すことができる

# greeiting_XXで共通で使用するメソッド
# texsに格納された3つの挨拶を出力する。
# ただし、2番目の要素に対してはブロック引数に定義された形式に沿って出力する。
def greeting_common(texts, &block)
  puts texts[0]
  puts block.call(texts[1])
  puts texts[2]
end

def greeting_ja(&block)
  texts = ["おはよう", "こんにちは", "こんばんわ"]
  # 【注意】
  # 他のメソッドにブロック引数を渡す場合は、「&」を付与しないと通常の引数と捉えられる
  greeting_common(texts, &block)
end

def greeting_en(&block)
  texts = ["Mornin", "Hello", "Evening"]
  # 【注意】
  # 他のメソッドにブロック引数を渡す場合は、「&」を付与しないと通常の引数と捉えられる
  greeting_common(texts, &block)
end

# greeting_commonに「&」を付けずに引数を渡した場合にはエラーが発生する
def greeting_err(&block)
  texts = ["おはよう", "こんにちは", "こんばんわ"]
  greeting_common(texts, block)
end

# 日本語の挨拶をする場合は、こんにちはの末尾に「!!!」を付与する
greeting_ja { |text| "#{text}!!!" }
#=>
# おはよう
# こんにちは!!!
# こんばんわ

puts "---"
# 英語の挨拶をする時は、Helloを大文字に変換する
greeting_en { |text| "#{text.upcase}" }
#=>
# Mornin
# HELLO
# Evening

puts "---"

# ggreeting_errメソッドでは、reeting_commonにブロック引数を渡す時に「&」を付与して
# いないためエラーになる。
# greeting_err { |text| "#{text}!!!" }
#=> wrong number of arguments (given 2, expected 1) (ArgumentError)

# --- 2.ブロック引数に対してメソッドを呼び出すことで、値を取得したり加工したりできる
undef greeting

def greeting(&block)
  puts "おはよう"
  # ブロックのサイズに応じて処理を分ける
  text =
    if block.arity == 1
      # ブロックサイズが1なら、文字列をブロックに渡す
      yield "こんにちは!!!"
    elsif block.arity == 2
      # ブロックサイスが2なら、2つの要素に分割してブロックに渡す
      yield("こんにちは", "!!!")
    end
  puts text
  puts "こんばんわ"
end

greeting { |text1, text2| "#{text1 * 2}#{text2 * 2}" }
#=>
# おはよう
# こんにちはこんにちは!!!!!!
# こんばんわ

puts "---"

greeting { |text1| "#{text1 * 2}" }
#=>
# おはよう
# こんにちは!!!こんにちは!!!
# こんばんわ
