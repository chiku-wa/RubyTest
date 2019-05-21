#encoding: utf-8
# ===
# === 12.5 環境変数や起動時引数の取得

# --- 環境変数を参照する
puts ENV["LANG"] #=> ja_JP.UTF-8

# --- 実行時の引数を取得する
# 以下のコマンドを実行する。
# ruby "12_05.rb" ABC DEF
puts "1番目の引数：#{ARGV[0]}" #=> ABC
puts "2番目の引数：#{ARGV[1]}" #=> DEF

# 12.5.1 組み込み定数
# ENVやARGVは組み込み定数と呼ばれる。他にも以下のような組み込み定数が存在する。

# Rubyのバージョンを出力する RUBY_VERSION
puts RUBY_VERSION #=> 2.6.2

# 標準出力を行う STDOUT
STDOUT.putc(99) #=> c
puts
STDOUT.puts "Tom" #=> Tom

# 定数なので再代入は可能だが、好ましくない
puts RUBY_VERSION #=> 2.6.2
RUBY_VERSION = "9.9.9" #=> warning: already initialized constant RUBY_VERSION
puts RUBY_VERSION #=> 9.9.9
