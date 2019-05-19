#encoding: utf-8
# ===
# === 12.4 特定の形式のファイルを読み書きする

# CSVクラス
require "csv"

# CSVの書き込み処理
CSV.open("./12_04_test.csv", "w") do |csv|
  # ヘッダ行を出力する(配列形式で書き込む)
  csv << ["ID", "Name", "Price"]
  # 明細行を出力する
  csv << [1, "Paciffic,Rim", 4800]
end

File.open("./12_04_test.csv", "r") do |f|
  puts f.readlines
end
#=> 「,」が紛れ込んでいる場合は自動的にダブルクォーテーションで囲まれる
# ID,Name,Price
# 1,"Paciffic,Rim",4800

# TSVの読み込み
# 第二引数で、区切り文字を指定する
# ファイルの中身(半角スペースだが、実際はタブ文字)
# who    do
# Tom    play
# Alice   listen
CSV.foreach("./12_04_test.tsv", col_sep: "\t") do |row|
  # 各行を標準出力する
  puts "1: #{row[0]}  2: #{row[1]}  3: #{row[2]}"
end
#=>
# 1: who  2: do  3:
# 1: Tom  2: play  3:
# 1: Alice  2: listen  3:
