#encoding: utf-8
# ===
# === 12.4 特定の形式のファイルを読み書きする

# --- 12.4.1 CSVクラス
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

# --- 12.4.2 JSONクラス
require "json"
user = { name: "Alice", age: 20, email: "alice@example.com" }

# ハッシュをJSON形式の文字列に変換する
user_json = user.to_json
puts user_json #=> {"name":"Alice","age":20,"email":"alice@example.com"}

# 逆に、JSONをパースしてハッシュ形式に変換する
json_parse = JSON.parse(user_json)
p json_parse #=> #=> {"name"=>"Alice", "age"=>20, "email"=>"alice@example.com"}
p json_parse.class #=> Hash

# --- 12.4.3 YAMLクラス
require "yaml"

# YAML形式のデータを作成する
yaml = <<TEXT
alice:
  name: "Alice"
  age: 20
  email: "alice@example.com"
TEXT

puts yaml
#=>
# alice:
#  name: "Alice"
#  age: 20
#  email: "alice@example.com"

# YAMLをハッシュに変換する
users = YAML.load(yaml)

puts users #=> {"alice"=>{"name"=>"Alice", "age"=>20, "email"=>"alice@example.com"}}
puts users.class #=> Hash

# ハッシュに新しい要素を追加する
users["alice"]["gender"] = :female

# ハッシュからYAMLに変換する
puts YAML.dump(users)
#=>
# ※「---」も出力される。
# ---
# alice:
#   name: Alice
#   age: 20
#   email: alice@example.com
#   gender: :female
