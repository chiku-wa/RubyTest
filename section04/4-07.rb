#encoding: utf-8

def get_range_element
  # ===4.7.1 さまざまな要素の取得方法
  arr = [1, 2, 3, 4, 5, 6]

  # [指定位置, 取得する要素数]で、指定した範囲の要素を抜き出せる
  puts arr[1, 4] # ->[2,3,4,5]

  # 複数の要素をピンポイントに取得したい場合は、value_atメソッドを使う
  puts arr.values_at(0, 2, 4) # -> [1,3,5]

  # -X：末尾から数えてX番目
  puts arr[-1] # ->6
  puts arr[-2] # ->5
  puts arr[-2, 2] # ->[5,6] ※注意：開始位置は右から数えるが、方向は左から右

  # lastメソッドを使うと末尾の要素を取得できる
  puts arr.last
  # 引数を渡すと、最後の要素から数えてXこ取得する
  puts arr.last(3) # ->[4,5,6]

  # firstメソッドを使うと先頭の要素を取得できる
  puts arr.first # ->1
  puts arr.first(3) #->[1,2,3]

  # ===4.7.2 さまざまな要素の変更方法
  # 負の添字で値を書き換えることも可能
  arr_10x = [10, 20, 30, 40, 50]
  arr_10x[-3, 2] = 99
  puts arr_10x.join(",") # ->[10, 20, 30, 99, 50]

  # << だけでなく、pushメソッドを使っても配列を追加できる
  arr_push = [11, 22, 33]
  arr_push.push(44) # ->[11,22,33,44]
  # 一度に複数の要素を追加できる
  arr_push.push(55, 66) # ->[11,22,33,55]
  puts arr_push.join(",")

  # 要素を削除する場合は以下をdeleteメソッドを用いる
  arr_delete = [1, 2, 3, 4, 5]
  arr_delete.delete(1) #->[2,3,4,5]
  puts arr_delete.join(",")

  # ===4.7.3 配列の連結
  # 配列を連結する場合はconcatメソッドを使う
  a = [1]
  b = [2, 3]
  a.concat(b)
  # 破壊的メソッドのため、aの値のみが書き換わる
  puts a.join(",")  #->[1,2,3]
  puts b.join(",") #->[2,3]

  # ★予期せぬバグの原因になるので、+演算子を用いること！
  c = [4]
  d = [5, 6]
  e = c + d #->[4,5,6]
  puts e.join(",")

  # ===4.7.4 和集合、差集合、積集合
  a = [1, 2, 3, 4, 5]
  b = [2, 4, 6]

  # 「|」和集合：2つの配列を重複排除して連結する
  puts (a | b).join(",") #->[1, 2, 3, 4, 5, 6]

  # 「-」差集合：左辺の要素から、右辺の要素の値を取り除く
  puts (a - b).join(",") #->[1,3,5]

  # 「&」積集合：2つの配列に共通する要素を抽出する
  puts (a & b).join(",") #->[2,4]

  # === 4.7.5 多重代入で残りの全要素を配列として受け取る
  # 多重代入では、右辺の方が数が多いと切り捨てられる
  a, b = 1, 2, 3
  puts a #->1
  puts b #->2
  # 変数名に「*」をつけると、切り捨てられるはずの値を配列形式で代入できる
  a, *b = 100, 200, 300
  puts a #->100
  puts b.join(",") #->[200,300]

  # === 4.7.6 1つの配列を複数の引数として展開する
  # pushメソッドで配列を挿入した場合、配列がそのまま挿入される
  a = []
  b = [2, 3]

  puts a.push(1) #->[1]
  puts a.push(b).join("") #->[1,[2,3]] 2次元配列
  puts a.size #->2

  # 配列を展開してpushする場合は「*」を用いること
  c = []
  d = [200, 300]
  c.push(100)
  puts c.push(*d).join(",")
  puts c.size #->3
end

get_range_element

# === 4.7.7 メソッドの可変長引数
# 引数に「*」をつけることで、可変長引数として受け取り、配列として扱える
def greeting(*names)
  "こんにちは！#{names.join(",")}"
end

puts greeting("佐藤さん", "山田さん") #=> 佐藤さん、山田さん
puts greeting("佐藤さん", "山田さん", "鈴木さん") #=> 佐藤さん、山田さん、鈴木さん

def get_range_element2
  a = [1, 2, 3]
  puts a + [4, 5, 6] #=>[1,2,3,4,5,6]

  # === 4.7.8 *で配列同士を非破壊的に連結する
  # 「*」で配列を展開することで、配列の結合が容易になる
  puts [*a, 4, 5, 6].join(",") #=>[1,2,3,4,5,6]
  # +と違い、任意の位置に追加することも可能
  puts [-1, 0, *a, 4, 5].join(",") #=>[-1,0,1,2,3,4,5]

  # === 4.7.9 「==」で等しいかどうか判断する
  # 「==」演算子は、配列の全要素が一致する場合のみTrueを返す
  puts [1, 2, 3] == [1, 2, 3] #=>True
  puts [1, 2, 3] == [1, 2, 3, 4] #=>False
  puts [1, 2, 3] == [1, 3, 2] #=>False

  # === 4.7.10 %記法で文字列の配列を簡潔に作る
  # []以外にも、「%」で配列を作る方法もある
  # 文字列を格納する配列を作る場合によく用いられる
  puts ["apple", "melon", "banana"].join(",") #=>["apple", "melon", "banana"]

  # --- %w or %Wで文字列の配列を作成する(各要素は半角スペースで区切ること)
  #「!」で囲む場合
  puts %w!apple melon banana!.join(",") #=>["apple", "melon", "banana"]
  # 丸かっこで囲む場合
  puts %w(apple melon banana).join(",") #=>["apple", "melon", "banana"]

  # 空白スペースを含めたい場合は「\」でエスケープすること
  puts %w(apple\ pie melon\ soda banana\ latte).join(",") #=>["apple pie", "melon soda", "banana latte"]

  # 式展開#{}や改行文字(\n)、タブ文字(\t)を含めたい場合は「%W」を用いること
  prefix = "This is"
  puts %W(#{prefix}\ an\ apple small\nmelon orange).join("|") #=>["Thisis", "an apple","small\nmelon", "orange"]

  # === 4.7.11 文字列を配列に変換する
  # charsメソッドで、文字列を配列に変換する
  puts "Ruby".chars.join("|") #=> ["R","u","b","y"]
  # splitメソッドで、引数の文字で区切られた単位で配列に変換する
  puts "Java,Ruby,Perl,C#".split(",").join("|") #=> ["Java","Ruby","Perl","C#"]

  # === 4.7.12 配列に初期値を設定する
  # 新規配列作成： arr = []と同じ意味
  arr = Array.new
  # Array.new(配列数, 初期値) すべての要素に一括で同じ値を設定する際に便利
  arr = Array.new(5, 0)
  puts arr.join("|") #=> [0,0,0,0,0]
  # 第二引数を省略した場合はすべてnilが格納される
  Array.new(5).join("|") #=> [nil,nil,nil,nil,nil]

  # ブロック引数を用いて初期化することもできる
  # この場合は引数の値がそのままループ数になる
  # 戻り値はそのまま配列として返される
  arr_block = Array.new(5) { |n| (n % 3 + 1) }
  puts arr_block.join("|") #=> [1,2,3,1,2]

  # === 4.7.13 配列に初期値を設定する場合の注意点
  # Array.newの第二引数で指定した初期値は、すべて同じ参照をもつため、一つを修正するとすべて書き換わる
  arr = Array.new(3, "default") #=> ["default","default","default"]
  # 1番目の要素だけを書き換えたつもりが、すべての要素に影響が及んでいる！
  arr[0].upcase!
  puts arr.join("|") #=> ["DEFAULT","DEFAULT","DEFAULT"]

  # 単一の要素のみ変更したいならブロックを使うこと
  arr2 = Array.new(3) { "default" }
  arr2[0].upcase!
  puts arr2.join("|") #=> ["DEFAULT","default","default"˜]

  # === 4.7.14 ミュータブル？イミュータブル？
  # オブジェクトにはミュータブル(mutable)と、イミュータブル(immutable)がある
  # イミュータブルオブジェクトであれば、4.7.13のように参照が書き換わることはない。
  # →プリミティブ型のオブジェクトはすべてイミュータブル！
  # イミュータブルオブジェクトは以下の通り。
  # ★★★★★★★★★★★★★★★★★★★★★★★★★★★
  # ① 数値(Integerクラス,Floatクラス)
  # ② シンボル(Symbol)
  # ③ true/false(TrueClassクラスとFalseClassクラス) # 「Classクラス」という表現で正しい、https://docs.ruby-lang.org/ja/latest/class/FalseClass.html
  # ④ nil(nilクラス)
  # ★★★★★★★★★★★★★★★★★★★★★★★★★★★

  # イミュータブルオブジェクトなら、すべての要素が書き換わることはない
  arr = Array.new(3, 1) #=> [1,1,1]
  n = arr[0]
  # n.negative! # 負の値に書き換える # 架空のメソッドなので実際には動かない…
  puts arr.join("|") #=> [-1,1,1]

  # === Column
  # 文字列は配列とは無関係なオブジェクトではあるものの、配列と同じように扱うことができる
  a = "abcd"
  # 特定の要素を書き換える
  a[0] = "A" #=> "Abcd"
  puts a

  # X番目からY個分の要素を書き換える
  a[1, 2] = "X" #=> "AXd"
  puts a

  # 末尾に「PQR」連結する
  a << "PQR" #=> "AXdPQR"]
  puts a
end

get_range_element2
