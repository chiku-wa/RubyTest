#encoding: utf-8
# ===
# === 9.6.2 ensureの代わりにブロックを使う

# --- 例外を用いる場合
# 第二引数で指定できるのは以下の通り
# r…読み取り
# w…書き込み
# a…追記
file = File.open("./test_09_06_02.txt", "w")
begin
  file << "Hello!"
  1 / 0 #=> 例外は発生するが、ensureでファイルはクローズされる
rescue => e
  puts "#{e.class} #{e.message}"
ensure
  file.close
end

# --- ブロックを用いる場合
File.open("test_09_06_02.txt", "a") do |f|
  f << "\nGood night!"
  1 / 0  #=> 例外が発生しても、ブロック内であれば自動的にクローズされる
end

# test.txtの中身は以下の通り
# Hello!
# Good night!
