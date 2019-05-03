#encoding: utf-8
# ===
# === 10.3.4 Proc.newとラムダの違い

# Proc.newでインスタンスを作成
greeting_proc = Proc.new { |text| text * 2 }
puts greeting_proc.call("こんにちは！") #=> こんにちは！こんにちは！

greeting_proc = proc { |text| text * 2 }
puts greeting_proc.call("こんにちは！") #=> こんにちは！こんにちは！

# ラムダ演算子(アロー演算子)でインスタンスを作成
greeting_arrow = ->(text) { text * 2 }
puts greeting_arrow.call("Hello!") #=> Hello!Hello!

# --- ラムダ演算子の方が引数のチェックが厳密
# nilを0に変換するためにto_iメソッドを用いる
caluclator_proc = Proc.new { |a, b, c| (a + b.to_i + c.to_i) }
# 引数が足りなくてもエラーにならない
puts caluclator_proc.call(10, 20, 30) #=> 60
puts caluclator_proc.call(10) #=> 10

# ラムダ演算子だと、引数が足りていないとエラーになる
caluclator_lambda = ->(a, b, c) { (a + b.to_i + c.to_i) }
puts caluclator_lambda.call(10, 20, 30) #=> 60
puts caluclator_lambda.call(10, 20) #=> wrong number of arguments (given 2, expected 3) (ArgumentError)
