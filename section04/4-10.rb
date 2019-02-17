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
  # ★Rubyでは例外処理はraiseとrescueを使用するためJavaなどのthrow、catchとは意味合いが違うため注意！

  # breakではその階層の処理しか脱出できないが、すべての階層から脱出したい場合はthrowとcatchを使う
  # catch <タグ> do
  #   <繰り返し処理など>
  #   throw <タグ>
  # end

  # orangeと1の組み合わせが出たら処理を終了する
  fruits = ["apple", "banana", "melon", "orange"]
  numbers = [1, 2, 3]
  catch :done do
    fruits.shuffle.each do |fruit|
      numbers.shuffle.each do |number|
        p "#{fruit}, #{number}"
        throw :done if fruit == "orange" && number == 1
      end
    end
  end

  # タグが一致しない場合はエラーになる
  catch :done do
    # throw :exit #=> `throw': uncaught throw :exit (UncaughtThrowError)
  end

  # throwの第二引数を指定すると、メソッドの戻り値になる
  res =
    catch :done do
      throw :done
    end
  p res #=> nil

  res =
    catch :done do
      throw :done, 123
    end
  p res #=> 123

  # catchとthrowは繰り返し処理以外でも使えるが、大半は大域脱出に使われることが多い

end

section_4_10

# === 4.10.3 繰り返し処理で使うbreakとreturnの違い
# ★挙動が複雑になるので、積極的に使うテクニックではない

# breakはその階層の脱出だが、returnはメソッドからの脱出になる

# 偶数が出たら10倍にして戻り値とする
def calc_with_break
  numbers = [1, 2, 3, 4, 5]
  target = 0
  numbers.shuffle.each do |number|
    target = number
    break if target.even?
  end
  target * 10
end

p calc_with_break

# returnだと戻り値が返る前にメソッドから抜けてしまうため、nilが返る
def calc_with_return
  numbers = [1, 2, 3, 4, 5]
  target = 0
  numbers.shuffle.each do |number|
    target = number
    return if target.even?
  end
  target * 10
end

p calc_with_return #=> nil

# returnはメソッドから抜けるためのものなので、メソッド外で実行するとエラーになる
# LocalJumpError: unexpected return

# === 4.10.4 next
# ループ内で処理を中断して次に映る場合はnextを使う
def section_4_10_4
  numbers = [1, 2, 3, 4, 5]
  numbers.shuffle.each do |n|
    # 偶数ならスキップして次のループへ移る
    next if n.even?
    puts n
  end

  # break同じく、対象となるのはその階層のみ
  fruits = ["apple", "banana", "melon"]
  numbers = [1, 2, 3]
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |number|
      next if number.even?
      puts "#{fruit}, #{number}"
    end
  end
  #=>
  # melon, 1
  # melon, 3
  # banana, 3
  # banana, 1
  # apple, 1
  # apple, 3
end

section_4_10_4

# === 4.10.5 redo
def section_4_10_5
  # redo を使うことで、条件に一致した場合はそのループの最初に戻すことができる
  foods = ["ピーマン", "にんじん", "きゅうり"]
  foods.each do |food|
    print "#{food}は好きですか？"
    answer = ["はい", "いいえ"][rand(2)]
    puts answer

    # ”はい”になるまで聞き直す
    redo if answer == "いいえ"
  end
end

section_4_10_5
