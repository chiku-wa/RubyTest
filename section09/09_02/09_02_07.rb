# encoding: utf-8
# ===
# === 9.2.7 継承関係とrescue節の順番に注意する

begin
  "Tom".no_exists_method
rescue NameError
  # NoMethodErrorはNameErrorのサブクラスなので補足される
  puts "例外：NameError"
end

# スーパークラスを先にrescueしてしまうと、後述のサブクラスのrescueは処理されなくなる
begin
  "Tom".no_exists_method
rescue NameError
  # NoMethodErrorはNameErrorのサブクラスなので補足される
  puts "例外：NameError"
rescue NoMethodError
  # NoMethodErrorはNameErrorのサブクラスであるため、この処理が実行されることは絶対ない
  puts "例外：NoMethodError"
end
#=> 例外：NameError

# サブクラスを先にrescueすることで、resucueされない処理が起きないようにする
begin
  "Tom".no_exists_method
rescue NoMethodError
  # NoMethodErrorが補足される
  puts "例外：NoMethodError"
rescue NameError
  # NameError、もしくはNoMethodError以外のNameErrorを継承した例外クラスを補足する
  puts "例外：NameError"
end
# 例外：NoMethodError

# もちろん、スーパークラスの例外が発生した場合も問題なく補足できる
begin
  # NameErrorを意図的に発生させる
  HogeObject.new
rescue NoMethodError
  # NoMethodErrorが補足される
  puts "例外：NoMethodError"
rescue NameError
  # NameError、もしくはNoMethodError以外のNameErrorを継承した例外クラスを補足する
  puts "例外：NameError"
end
#=> 例外：NameError

# StandardErrorクラスとそのサブクラスをまとめてrescueする
begin
  # StandaedErrorを意図的に発生させる
  raise StandardError
rescue NoMethodError => e
  puts "#{e.class} #{e.message}"
rescue NameError => e
  puts "#{e.class} #{e.message}"
rescue
  # rescue節で補足するクラスを省略した場合はStandardErrorが補足される
  puts "StandaedError!"
end
#=> StandaedError!
