# encoding: utf-8
# ===
# === 9.2.5 クラスを指定して補足する例外を限定する

# NoMethodErrorのみをresucueで補足する
begin
  # 存在しないメソッドを呼び出す
  "Alice".no_exists_method
rescue NoMethodError
  # NoMethodError
  puts "例外：存在しないメソッドが呼び出されました。"
end

# NoDivisionErrorは補足できないためエラーになる
#=> Traceback (most recent call last):
#  〜/section09/09_02/09_02_05.rb:16:in `<main>'
#  〜/section09/09_02/09_02_05.rb:16:in `/': divided by 0 (ZeroDivisionError)
# begin
#   # 0で除算しようとする
#   1 / 0
# rescue NoMethodError
#   puts "例外：存在しないメソッドが呼び出されました。"
# end

# resucueを複数記述することで、複数のクラスを補足できる
begin
  1 / 0
rescue NoMethodError
  puts "例外：存在しないメソッドが呼び出されました。"
rescue ZeroDivisionError
  puts "例外：0で除算されました。"
end
#=> 例外：0で除算されました。

# 複数の例外オブジェクトを変数に格納することもできる
begin
  # どちらの処理もちゃんと補足される

  # ①
  "Tom".no_exists_method

  # ②
  # 1/0
rescue NoMethodError, ZeroDivisionError => e
  puts "例外：存在しないメソッドが指定されたか、0除算が行われました。"
  puts "#{e.class} #{e.message}"
  #=>
  # 以下のどちらかが出力される。
  # ①
  # 例外：存在しないメソッドが指定されたか、0除算が行われました。
  # NoMethodError undefined method `no_exists_method' for "Tom":String
  #
  # ②
  # 例外：存在しないメソッドが指定されたか、0除算が行われました。
  # ZeroDivisionError divided by 0
end
