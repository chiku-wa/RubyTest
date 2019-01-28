# encoding: utf-8

def array_test
  #型確認
  puts [].class #-> Array

  puts

  # 基本的な配列の作成と繰り返し処理
  # 同じ配列内に数字と文字列が混じっていてもOK
  fruits = [
    1,
    "banana",
    2,
    "peach",
    3,
    "apple",
  ]

  # 添字を使って取り出す
  puts fruits[0]
  puts fruits[1]
  puts fruits[2]
  puts fruits[3]

  # 存在しない添字の場合はnilになる
  fruits[1000] # -> nil

  # 配列の長さを測る場合は、size or lengthメソッドを用いる
  # lengthはsizeメソッドのエイリアス
  puts fruits.size
  puts fruits.length

  #配列の中に配列を含めることも可能
  two_demensional = [
    [1, 2, 3],
    ["a", "b", "c"],
  ]
  puts two_demensional

  puts

  # 4.2.1
  array = [1, 2, 3]
  puts array
  array[0] = 100
  puts array

  puts
  puts "間の要素をスキップして添字を指定"
  array[5] = 9
  puts array

  puts

  add_test_array = [1, 2, 3, 4, 5]
  add_test_array << 6
  puts add_test_array

  puts

  delete_test_array = [1, 2, 3, 4, 5]
  delete_test_array.delete_at(2)
  puts delete_test_array

  # 4.2.2 配列を使った多重代入
  a, b = [111, 222]
  puts a
  puts b

  c, d = [333]
  puts c # ->333
  puts d # -> nil

  e, f = [111, 222, 333]
  puts e # -> 111
  puts f # -> 222

  # 商と余りを用いた多重代入の活用法
  quotient_remainder = 14.divmod(5) #-> [2, 4]
  puts "商#{quotient_remainder[0]}、余り#{quotient_remainder[1]}" # -> 商2、余り4

  quotient, remainder = 14.divmod(5) #-> [2, 4]
  puts "商#{quotient}、余り#{remainder}" # -> 商2、余り4

  # 繰り返し処理
  numbers = [1, 2, 3, 4]
  sum = 0
  numbers.each do |number|
    sum += number
  end
  puts sum

  puts

  # 4.3.3 配列の要素を削除する条件を自由に指定する
  numbers2 = [1, 2, 3, 4, 5]
  numbers2.delete_if do |number|
    # 奇数ならtrueを返す
    number.odd?
  end
  puts numbers2

  puts

  # ブロック引数は省略可能
  array = ["", "", ""]
  sum = 0
  array.each do
    sum += 1
  end
  puts sum

  # シャドーイングの確認
  shadowing_test_arr = [1, 2, 3]
  sum_value = 100
  sum = 0
  # sumvalueは、ブロック引数としての役割しか持たず、100という値は使用されない
  shadowing_test_arr.each do |sum_value|
    sum += sum_value
  end
  puts sum

  # {}をブロックとして使うことも可能
  sum = 0
  [1, 2, 3, 4, 5].each { |number| sum += number }
  puts sum

  # 4.4.1 map/collect
  # 以下の処理はどちらも同じことをやっている

  # eachで処理
  numbers = [1, 2, 3, 4, 5]
  numbers_10x = []
  numbers.each do |number|
    numbers_10x << number * 10
  end
  puts numbers_10x

  # mapで処理
  numbers = [1, 2, 3, 4, 5]
  numbers_10x = numbers.map { |number| number * 10 }
  puts numbers_10x

  # 4.4.2 select/find_all/reject
  # select
  # 偶数を抽出
  numbers_event = [1, 2, 3, 4, 5, 6].select { |n| n.even? }
  puts numbers_event

  # reject
  # 奇数を抽出
  numbers_odd = [1, 2, 3, 4, 5, 6].reject { |n| n.even? }
  puts numbers_odd

  # find/detect
  even_val = [1, 2, 3, 4, 5, 6].find { |n| n.even? }
  puts even_val #->2

  # inject/reduce
  numbers = [1, 2, 3, 4, 5]
  sum = numbers.inject(0) { |result, number| result + number }
  puts sum # ->15

  week = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"].inject("Sun") { |result, w| result + w }
  puts week # ->SunMonTueWedThuFriSat

  #「&:」で省略
  # 配列内の文字列を大文字に変換する
  # [通常の記述方法]
  puts ["apple", "banana", "grape"].map { |s| s.upcase }
  # [省略形]
  # 注意：{}ではなく、()で括る
  puts ["apple", "banana", "grape"].map(&:upcase)

  # 省略できないパターン
  # ブロック引数が複数存在する
  [1, 2, 3].inject(1) { |result, n| result + n }

  # ブロック内のメソッドに引数が存在する
  # 16進数に変換する処理
  [100, 200, 300].map { |n| n.to_s(16) }

  # ブロック内で複数の処理を実行している
  [1, 2, 3].map do |n|
    m = n * 10
    m.to_s
  end

  # 範囲
  array_num = (1..10)
  puts array_num
end

array_test
