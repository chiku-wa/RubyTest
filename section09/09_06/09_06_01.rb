#encoding: utf-8
# ===
# === 9.6.1 ensure

# ensureはJavaでいうところのfinallyに近い。
# 例外発生有無にかかわらずか鳴らす実行される。
begin
  puts "begin"
  raise StandardError, "テスト用のエラー"
rescue => e
  puts "rescue"
ensure
  puts "ensure"
end
#=>
# begin
# rescue
# ensure

# rescureを省略してensureだけ記すこともできる。
# どんな例外が発生しても、必ず処理させたいプログラムがある場合はこの記述を用いる。
begin
  puts "begin"
  raise StandardError, "テスト用のエラー"
ensure
  puts "ensure"
end
#=>
# begin
# ensure
# Traceback (most recent call last):
# 〜/section09/09_06/09_06_01.rb:22:in `<main>': テスト用のエラー (StandardError)
