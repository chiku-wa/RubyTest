# encoding: utf-8
# ================================
# 4.9 様々な繰り返し処理
# ================================
def section_4_9
  # === 4.9.1 timesメソッド
  # 単純に処理をn回繰り返したい場合はtimesメソッドを用いる
  sum = 0
  5.times { |n| sum += n }
  p sum #=> 10

  # 不要ならブロック引数も省略できる
  sum = 0
  5.times { sum += 1 }
  p sum #=> 5

  # === 4.9.2 uptoメソッドとdowntoメソッド
  # nからmまで数値を1つずつ増やしながら処理したい場合はuptoメソッドを使う
  10.upto(15) { |n| p n } #=> 10 11 12 13 14 15

  # 逆に減らしたい場合はdowntoメソッドを使う
  15.downto(10) { |n| p n } #=> 15 14 13 12 11 10

  # === 4.9.3 stepメソッド
  # nからmまでの数字を、x個ずつ増やす or 減らしながら処理したい場合はstepメソッドを使う
  # n.step(m, x)

  # 増やす
  1.step(10, 2) { |n| p n } #=> 1 3 5 7 9

  10.step(1, -2) { |n| p n } #=> 10 8 6 4 2

  # === 4.9.4 while文とuntil文
  # --- while
  arr = []
  while arr.size < 5
    arr << 1
  end
  p arr #=> [1,1,1,1,1]

  # doを後ろに入れて1行にまとめることができる
  arr = []
  while arr.size < 5 do arr << 1 end
  p arr #=> [1,1,1,1,1]

  # doを使うより、後ろに修飾子として置いたほうがスッキリする
  # 構文：
  # <真のときに実行する処理> while <条件式>
  arr = []
  arr << 1 while arr.size < 5
  p arr #=> [1,1,1,1,1]

  # --- begin,while
  # 必ず処理を1回実行させたい場合は、begin〜whileを用いること

  # 一度も実行されない
  while false
    p "Hello!"
  end

  # 一度は実行され、その後にwhileの判定が行われる
  begin
    p "Hello!"
  end while false

  # --- until
  # 条件に一致しない間繰り返す
  arr = [10, 20, 30, 40, 50]
  until arr.size <= 2
    arr.delete_at(-1) # 末尾の要素を削除
  end
  p arr #=> [10,20]

  # === 4.9.5 for文
  # 配列やハッシュの場合はfor文で繰り返すこともできる

  # for <変数> in <配列やハッシュ>
  #   繰り返し処理
  # end
  numbers = [1, 2, 3, 4, 5]
  sum = 0
  for number in numbers
    sum += number
  end
  p sum #=> 15

  # doで記すこともできる
  numbers = [1, 2, 3, 4, 5]
  sum = 0
  for number in numbers do sum += number end
  p sum #=> 15

  # とはいえ、通常はeachを使う場合が多い
  numbers = [1, 2, 3, 4, 5]
  sum = 0
  numbers.each { |n| sum += n }
  p sum #=> 15

  # forはローカル変数が外部でも参照できる
  fruits = ["apple", "banana", "melon"]
  # eachだと参照できない
  fruits.each do |fruit|
    fruits_bascket = fruit
  end
  # p fruits_bascket #=> undefined local variable or method

  for fruit in fruits
    fruits_bascket = fruit
  end
  p fruits_bascket #=> melon

  # === 4.9.6 loopメソッド
  # whileを用いた無限ループ
  # while true
  #   # 処理
  # end

  # loop...doを用いた無限ループ
  # Kernelモジュールの一部、詳しくは10章
  # loop do
  #   #処理
  # end

  # breakを使ってループから抜けることができる
  loop do
    # 0〜4の間でランダムな変数を取得する
    n = rand(5)
    puts n
    # 2ならループから抜ける
    break if n == 2
  end

  while true
    # 0〜4の間でランダムな変数を取得する
    n = rand(5)
    puts n
    # 2ならループから抜ける
    break if n == 2
  end

  # ================================================================
  # loopメソッドはローカル変数を外部で参照できないが、whileは参照可能
  # ================================================================

  # === column 繰り返し処理とEnumerableモジュール
  # 配列には、eachやselectメソッドなど様々なメソッドが用意されている。
  # 実はそれ以外にもこれらのメソッドを使用できる。

  # 範囲オブジェクトに対しても繰り返し処理が使用できる
  arr = (1..3).map { |num| num * 10 }
  p arr #=> [10,20,30]

  # uptoメソッドに対してselectが使用できる
  arr = 1.upto(5).select { |num| num.odd? }
  p arr #=> [1,3,5]

  # これらの仕組みが使えるのは、Array,Range,Enumeratorが、Enumerableをincludeしているから
  # [1,2,3] -> Array
  # (1..3) -> Range
  # upto -> Enumerator

  p [1, 2, 3].class #=> Array
  p Array.include?(Enumerable) #=> True

  p (1..3).class #=> Range
  p Range.include?(Enumerable) #=> True

  p 1.upto(5).class #=>Enumerator
  p Enumerator.include?(Enumerable) #=> True

  # ★「繰り返し処理に関連するモジュールはEnumerableに定義されている事が多い」と覚えておくといい。
  # ★そのため、繰り返し処理を調べる場合は、EnumerableモジュールのAPIドキュメントについても調べる必要がある。
end

section_4_9
