#encoding: utf-8
# ===
# === 12.3 ファイルやディレクトリの扱い

# --- Fileクラス、Dirクラス
# ファイル or ディレクトリの存在チェック
file_name = "12_03.rb"
if File.exists?("./#{file_name}")
  puts "#{file_name}は存在します。"
else
  puts "#{file_name}は存在しません。"
end
#=> 12_03.rbは存在します。

dir = "section12"
if Dir.exists?("../section12")
  puts "#{dir}は存在します。"
else
  puts "#{dir}は存在しません。"
end
#=> section12は存在します。

# --- Fileクラスを用いたファイルの読み書き
# ファイルの行数を出力する
File.open("./12_02.rb", "r") do |f|
  puts f.readlines.count
end
#=> 27

# 書き込みを行う(ファイルが存在しない場合は新規にファイルを生成する)
File.open("./12_03_test.txt", "w") do |f|
  f.puts "Hello!World!"
end
#=> ./12_03_test.txt
# Hello!World!

# --- FileUtilsモジュール
require "fileutils"
FileUtils.mv("./12_03_test.txt", "12_03_FileUtilsTest.txt")

# --- Pathnameクラス
require "pathname"
path_name = Pathname.new("../section12")

# ファイルかどうか判断するfile?メソッド
p path_name.file? #=> false

# ディレクトリかどうかを判断するdir?メソッド
p path_name.directory?  #=> true

# 「section12」フォルダ配下にある「12_03.rb」へのファイルパス(相対パス)を生成する
p path_name.join("12_03.rb").to_s #=> "../section12/12_03.rb"

# === Column requireの単位はライブラリ
# Ruby標準のKernelモジュールのopneメソッドでは、URLは開けない(ファイルを開くためのメソッドのため)
# open "https://google.co.jp"
#=> No such file or directory @ rb_sysopen - https://google.co.jp (Errno::ENOENT)

# open-uriライブラリを取り込むことで、openメソッドでもURLを開けるようになる
require "open-uri"
res = open "https://google.co.jp"
p res #=> #<Tempfile:/var/folders/_f/2zlc08nj3f71nbqm_cf42nwm0000gn/T/open-uri20190519-61381-ntwor4>
