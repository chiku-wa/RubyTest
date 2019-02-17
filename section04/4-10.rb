# encoding: utf-8
# ================================
# 4.10 繰り返し処理用の制御構造
# ================================
def section_4_10
  # === 4.10.1 break
  # breakを使うと処理を途中で抜けることができる

  # shuffle関数でで配列の順序をランダムに並び替える
  numbers = [1, 2, 3, 4, 5].shuffle
  numbers.each do |n|
    p n
    # 5が出たら処理を抜ける
    break if n == 5
  end

  # breakはwhileやfor、loopでも使用できる

  # breakに引数を渡す事もできる
  # 引数を渡さない場合はnilが返る
  res =
    while true
      break
    end
  p res #=> nil

  res =
    while true
      break 123
    end
  p res #=> 123

  # 繰り返し処理が階層になっている場合は、breakが実行された階層のみ脱出する
  fruits = ["apple", "banana", "melon"]
  numbers = [1, 2, 3]
  fruits.each do |fruit|
    # 配列をランダムに並び替えて、3が出たらbreakする
    numbers.shuffle.each do |n|
      p "#{fruit}, #{n}"
      break if n == 3
    end
  end
  #=>
  # fruitsの配列はすべて出力されている
  # "apple, 1"
  # "apple, 3"
  # "banana, 1"
  # "banana, 2"
  # "banana, 3"
  # "melon, 3"

  # === 4.10.2 throwとcatchを使った大域脱出
  # ★
end

section_4_10
