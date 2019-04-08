#encoding: utf-8
# ===
# === 7.10.5 等値を判断するメソッドや演算子を理解する

# ---
# --- equal メソッド
# object_idが等しければtrue
puts "------"
a = "abc"
b = "abc"
p a.equal?(b) #=> false

c = a
p a.equal?(c) #=> true

# ---
# --- == メソッド
# オブジェクトの中身が等しければtrue
puts "------"
str = "hoge"
p "hoge" == str #=> true
p 1 == 1.0 #=> true

# ---
# --- eql? メソッド
# ==と似ており、人間が見て自然に感じる判定を行うが、IntegerとFloatを異なるものとして扱うなど
# 判定が厳密である。
puts "------"
str = "hoge"
p "hoge".eql?(str) #=> true
p 1.eql?(1.0) #=> false

# この判定の基準は、「ハッシュのキーとして定義した時に、別の要素として扱われるか(別のキーとして
# 扱われるか)」である

# "hoge".eql?(str)はtrueなので同じ要素として扱われる
h = { "hoge" => "Foo" }
str = "hoge"
# ※同じキーとして扱われるので要素が上書きされる(追加されない)
h[str] = "Bar"
p h  #=> {"hoge"=>"Bar"}

# 1.eql?(1.0)はfalseなので別の要素として扱われる
h = { 1 => "Integer" }
# 異なるキーとして扱われるので要素が追加される
h[1.0] = "Float"
p h #=> {1=>"Integer", 1.0=>"Float"}

# eql?メソッドでtrueならhashメソッドの結果も一致する
str1 = "japan"
str2 = "japan"
p str1.eql?(str2) #=> true

p str1.hash  #=> -167070357361446863
p str2.hash  #=> -167070357361446863 ※上と同じ

# 逆に一致しないならhashも異なる
num1 = 1
num2 = 1.0

p num1.eql?(num2) #=> false
p num1.hash  #=> 2175451717984154981
p num2.hash  #=> 4551860485506479232

# そのため、eql?を再定義した場合は、hashメソッドの定義も修正し、
# eql?メソッドがtrueを返すなら同じハッシュ値を返すようにし、逆にfalseを返すなら異なる
# ハッシュ値を返すように再定義してやる必要がある。

# ---
# --- === メソッド
# case文のwhen節が内部的に===と同じ処理を行っている
text = "12-3456-7890"
case text
when /^\d{3}-\d{4}$/
  # /\d{3}-\d{4}/ === text　と同じ
  puts "郵便番号"
when /^\d{4}\/\d{2}\/\d{2}$/
  # /^\d{4}\/\d{2}\/\d{2}$/ === text　と同じ
  puts "日付"
when /^\d+-\d+-\d+$/
  # /^\d+-\d+-\d+$/ === text　と同じ
  puts "電話番号"
end
#=>電話番号

# Classクラスが===メソッドを再定義しているため、ClassクラスのインスタンスであるStringクラスや
# Arrayクラスが、以下のように判定することもできる
case 100
when String
  # String === [](String.===[])　と同じ
  puts "String"
when Array
  # Array === [](Array.===[])　と同じ
  puts "Array"
when Integer
  # Integer === [](Integer.===[])　と同じ
  puts "Integer"
end
#=> Integer

# 右辺の値が左辺に含まれていれば(包括関係にあれば)trueとなる
#パターンによって挙動が異なる。

# [クラスとオブジェクト同士の比較]
# Stringクラスから生成したインスタンスはStringクラスに含まれている
p String === "Foo" #=> true

# 左辺と右辺を逆にすると包括関係が変わるためfalse となる
p "Foo" === String #=> false

# [Rangeオブジェクトの比較]
range = 0..19

# 15はRangeの範囲内なのでtrue
p range === 15 #=> true

# 20はRangeの範囲外なのでfalse
p range === 20 #=> false

# [正規表現]
regex = /\d{3}-\d{4}/

p regex === "123-4567" #=> true
p regex === "123-456" #=> false

# 「=~」とは異なり、正規表現オブジェクトは必ず左辺にある必要がある
# Regexpクラスの===メソッドを呼び出さないと正規表現として比較されないため
# Stringクラスの===メソッドでは正規表現を検知できない
p "123-4567" === regex #=> false
