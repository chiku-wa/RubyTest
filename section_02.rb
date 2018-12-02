# encoding: utf-8

# ====================
# ヒアドキュメントテスト
# ====================

# インデントあり
def indentation_hyphen
  str = <<-EOS
   「-」
    aaa
    bbb
  EOS

  str
end

puts indentation_hyphen

# インデントが削除される
def indentation_tilde
  str = <<~EOS
    　「~」
      1行目
      2行目
      3行目
  EOS

  str
end

puts indentation_tilde

# 式展開
def expressionExpansion
  msg = "Hello,World!"

  str = <<-EOL
    式展開テスト
    変数 -> #{msg}
  EOL

  str
end

puts expressionExpansion

# ====================
# 2.4 数値
# ====================

#インクリメント
def increment_test
  cnt = 0
  str = ""

  while cnt < 5
    puts cnt
    cnt += 1

    # ++は使えない
    # cnt++
  end

  str
end

puts increment_test

# ====================
# 2.8.4 数値
# ====================
def sprintf_test
  num = 1.2

  # 小数点第三位まで出力
  # 出力例:
  # 1.200
  sprintf("%0.3f", num)

  # 以下の記述方法でも同様のことが可能
  # '%0.3f' % num
end

puts sprintf_test

# ====================
# 2.8.5 その他、文字列作成のいろいろ
# ====================
def string_test
  # 文字列の繰り返し
  # 出力例
  # Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!Hello!
  puts "Hello!" * 10

  # 数値→文字への変換
  # 出力例：
  # String
  str = 123.to_s
  puts str.class # クラスの種類を出力

  # 配列の結合
  # 出力例：
  # 100200300
  arr = [100, 200, 300]
  puts arr.to_s + " -> " + arr.join()
end

string_test

# ====================
# 2.9.4数値クラスのあれこれ
# ====================
def number_test
  # 整数ならInteger、少数ならFloat
  puts 1.class   # ->Integer
  puts 1.5.class # ->FLoat

  # RUby2.4以降は、大きい値もそうでない値もすべてInteger
  puts 99.class                      # ->Intger
  puts 999999999999999999999.class   # ->Integer
end

number_test

# ====================
# 2.10.1 &&や||の戻り値と評価を終了するタイミング
# ====================
def boolean_test
  # nilをfalse、nil以外をtrueとになすため、戻り値がtrue,false以外になる場合もある
  puts (1 && 2 && 3)      #  ＆の場合、1つでもfalseだと結果が評価が覆るため最後まで評価する -> 3
  puts (1 && nil && 2)    # 同上 ->nil
  puts (1 && 2 || 3)      # |の場合、1つでもtrueならすべてtrueになるため、最後まで評価しない -> 3
end

boolean_test

# ====================
# 2.10.2 優先順位が低い and、or、not
# ====================
def operator_test
  # andは||より優先順位が低いため、あとで処理される
end

operator_test

# ====================
# 2.10.3 unless文
# ====================
def unless_test
  error = "error"

  if error != "ok"
    puts "エラーがあります"
  end

  # unlessは、否定形と同じ意味を持つ
  unless error == "ok"
    puts "エラーがあります"
  end
end

unless_test

# ====================
# 2.11 デフォルト値付きの引数
# ====================
# 引数cにデフォルト値を設定
def default_value_test(a, b, c = 0, d)
  a + b + c + d
end

puts default_value_test(1, 10, 100, 1000)

#デフォルト値付きのメソッドは引数を省略できる
#以下の場合、a,b,dに引数を渡しており、cはメソッドで定義されたデフォルト値を使用している
puts default_value_test(1, 10, 1000)

# ====================
# 2.12 ?で終わるメソッド
# ====================
def question_test?
  # ?で終わるメソッドは、Rubyの慣習でtrue,falseを返すメソッドである

  # 空文字であればtrue
  puts "".empty?
  puts "Hello!".empty?

  #特定の文字列を含んでいればtrue
  puts "abc".include?("a")
  puts "abc".include?("d")

  # 奇数ならtrue
  puts 1.odd?
  puts 2.odd?

  # オブジェクトがnilならtrue
  str = nil
  puts str.nil?
end

question_test?

# ====================
# 2.13 !で終わるメソッド
# ====================
def exclamation_test
  str = "abc"

  # 変数そのものの出力は変わらない
  # abc
  puts str.upcase
  puts str

  # !で終わるメソッドは破壊的メソッドと呼ばれ、変数そのものを書き換える
  # ABC
  puts str.upcase!
  puts str
end

exclamation_test

# ====================
# 2.12.2 エイリアスメソッド
# ====================
def length_size_test
  # lengthとsizeは同じ性質を持ち、双方とも文字列の長さを返す
  str = "abcde"
  puts str.length # ->5
  puts str.size   # ->5
end

length_size_test

# ====================
# 2.12.4 疑似変数
# ====================
def pseudo_variable_test
  # 特定の変数は疑似変数と呼ばれる

  # self:オブジェクト自身
  puts self

  # __FILE__:現在のソースファイル名
  puts __FILE__

  # __LINE__:現在のソースファイル中の番号
  puts __LINE__

  # ___ENCODING_:現在のソースファイルのスクリプトエンコーディング
  puts __ENCODING__
end

pseudo_variable_test

# ====================
# 2.12.5 参照の概念を理解する
# ====================
def object_reference_test
  # オブジェクトIDを確認する
  # 同じ値を格納しても、参照が異なるため、異なるIDが出力される
  str1 = "abc"
  puts str1.object_id

  str2 = "abc"
  puts str2.object_id

  # 別の変数に代入すると参照がコピーされるため、同じオブジェクトIDが出力される
  str3 = str2
  puts str3.object_id

  # equal?メソッドでオブジェクトが同じかどうかを判定できる
  puts str2.equal?(str3) # ->true

  # 変数を書き換えると参照が変わるため、異なるオブジェクトIDを返すようになる
  str2 = "def"
  puts str2.object_id
  puts str3.object_id

  puts str2.equal?(str3) # ->false
end

object_reference_test

# ====================
# 2.12.6 組み込みライブラリ、標準ライブラリ、gem
# ====================
def builtin_standard_gem_test
end

builtin_standard_gem_test
