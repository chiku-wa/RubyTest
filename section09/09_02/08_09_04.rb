# encoding: utf-8
# ===
# === 9.2.4 例外オブジェクトから情報を取得する

# 例外オブジェクトを変数で受け取りたい場合は、rescue句に「=>変数名」を記す
begin
  # 例外を発生させる
  1 / 0
rescue => e
  # 例外オブジェクトを使って各種メソッドを実行する。

  # エラークラス
  puts "エラークラス:#{e.class}" #=> エラークラス:ZeroDivisionError

  # messageメソッドでメッセージを出力する
  puts "例外メッセージ:#{e.message}" #=> #=> 例外メッセージ:divided by 0

  # バックトレース
  puts "バックトレース===="
  puts e.backtrace
  puts "==="
  #=>
  # 〜section08/08_09/08_09_04.rb:7:in `/'
  # 〜section08/08_09/08_09_04.rb:7:in `<main>'
end
