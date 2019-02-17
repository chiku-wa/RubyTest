# encoding: utf-8
def array_block
  # === 4.8.1 添字付きの繰り返し処理
  # each_with_indexメソッドを使うと、ブロックの第二引数でインデックスを首都帰できる
  ["apple", "melon", "banana"].each_with_index { |fruit, i| puts "#{i}番目は#{fruit}です" }
  # =>
  # 0番目はappleです
  # 1番目はmelonです
  # 2番目はbananaです

  # === 4.8.2 with_indexメソッドを使った添字付きの繰り返し処理
  # each以外のメソッドにもインデックスを付与したい場合は、with_indexメソッドを用いる

  # mapとwith_index併用
  arr = ["apple", "melon", "banana"]
  arr2 = arr.map.with_index { |fruit, i| "#{i}番目は#{fruit}です" }
  puts arr2.join("|") #=> [0番目はappleです,"1番目はmelonです","2番目はbananaです"]

  # 添字が奇数の要素を削除する
  arr = ["apple", "melon", "banana", "orange"]
  arr.delete_if.with_index { |fruit, i| i.odd? }
  puts arr.join("|") #=> ["apple", "banana"]

  #eachとの組み合わせ
  arr = ["apple", "melon", "banana", "orange"]
  arr.each.with_index { |fruit, i| puts fruit if i.even? } #=> ["apple", "banana"]

  # with_indexが他の繰り返し処理と併用できる仕組み
  # ①with_indexメソッドは、Enumeratorクラスのインスタンスメソッド(クラスの中にあるメソッド)である。
  # ②each、map、delete_ifメソッドは、ブロックを省略するとEnumeratorを返す様になっている
  # ③②はEnumeratorインスタンスなので、with_indexを使用することができる
  fruits = ["apple"]
  puts fruits.each.class #=> #<Enumerator: ["apple"]:each>
  puts fruits.map.class #=> #<Enumerator: ["apple"]:map>
  puts fruits.delete_if.class #=> #<Enumerator: ["apple"]:delete_if>

  # === 4.8.3 添字を0以外の数値から開始させる
  # with_indexメソッドに引数を渡すと、その引数の数字から開始される
  # 1から開始する
  ["apple", "melon", "banana"].each.with_index(1) { |fruit, i| puts "#{i}番目は#{fruit}" }
  #=>
  # 1番目はapple
  # 2番目はmelon
  # 3番目はbanana

  # 10から開始して配列として返す
  arr2 = ["apple", "melon", "banana"].map.with_index(10) { |fruit, i| "#{i}番目は#{fruit}" }
  puts arr2 #=> ["11番目はapple","12番目はmelon","13番目はbanana"]

  # === 4.8.4 配列がブロック引数に渡される場合
  # 例：縦横のサイズが格納された配列
  demensions = [
    [10, 20],
    [30, 40],
    [50, 60],
  ]

  # 2次元配列の場合、そのままブロックに渡すと配列のまま
  areas = demensions.map do |demension|
    length = demension[0]
    width = demension[1]
    length * width
  end
  puts areas.join("|") #=> [200, 1200, 3000]

  # ブロック引数を2つにすると、配列が展開された状態になる
  areas = demensions.map do |length, width|
    length * width
  end
  puts areas.join("|")

  # 要素数＜ブロック引数の場合は、残りのブロック引数にnilが格納される
  # ※pは、開発者用の出力メソッド(nilを出力するためのもの)
  demensions.each { |length, width, foo, bar| p [length, width, foo, bar] }
  #=>
  # [10, 20, nil, nil]
  # [30, 40, nil, nil]
  # [50, 60, nil, nil]

  # with_indexと併用する場合の注意点
  # ブロック引数に、配列インデックスを横並びで記すと、第一引数に配列がまるごと渡ってしまう
  demensions.each.with_index { |length, width, i| p [length, width, i] }
  #=>
  # [[10, 20], 0, nil]
  # [[30, 40], 1, nil]
  # [[50, 60], 2, nil]

  # ()で囲むことで、配列が展開された状態でブロック引数に渡される
  demensions.each.with_index { |(length, width), i| p [length, width, i] }
  #=>
  # [10, 20, 0]
  # [30, 40, 1]
  # [50, 60, 2]

  # === 4.8.5 ブロックローカル引数
  # ブロック引数を「;」で区切ると、ブロックローカル引数となり、ブロックの外の変数と競合しなくなる
  # 以下の例はブロック引数だろうがなんだろうが同じ結果が返ってくるので不適切かもしれない…
  # ★シャドーイングは可読性を下げるため、変数名を工夫するなどする方が◯
  sum = 0
  [1, 2, 3].each do |n, sum|
    sum = 10
    sum += n
    p sum
  end
  #=>11
  #=>12
  #=>13
  puts sum #=> 0

  # 4.8.6 繰り返し処理以外でも使用されるブロック
  # ファイル操作でも繰り返し処理が使用できる
  # sample.txtを開いてテキストを書き込む処理
  File.open("./sample.txt", "w") do |file|
    file.puts("Line 1")
    file.puts("Line 2")
    file.puts("Line 3")
    # Close処理は自動で行うので処理の記述は不要
  end
end

array_block
