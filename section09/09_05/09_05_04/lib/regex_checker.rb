# encoding: utf-8
# ===
# === 9.5.4 実装を開始する

# チェック対象の文字列の入力を受け付ける
print "Text?: "
input_text = gets.chomp

begin
  # 正規表現パターンの入力を受け付ける
  print "Pattern?: "
  input_regex = gets.chomp

  # 正規表現に一致した文字列を抜き出す
  regex = /#{input_regex}/
  # 以下でも同様の処理が可能
  # regex=Regexp.new(input_regex)

  # 一致した文字列があれば「,」区切りで返し、そうでなければ一致しなかった旨のメッセージを表示する
  matches = input_text.scan(regex)
  if matches.size > 0
    matches.scan(regex).join(", ")
  else
    puts "Nothing matchd."
  end
rescue RegexpError => e
  # 正規表現パターンが不正な場合はretryする
  puts "Invalid pattern: #{e.message}"
  retry
end
