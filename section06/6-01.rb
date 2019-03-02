# encoding: utf-8
# ================================
# 6.2 正規表現って何？
# ================================

# Rubyでは、正規表現を表すRegexpクラスを用いる
# これの語源は「正規表現」を英語で表現した「Regex expression」である
# ※他にも「Regex」と呼称されることもある

# ===
# === 6.2.1 正規表現の便利さを知る

# --- プログラム言語のみを文中から抜き出す
def regex_test_language
  # ヒアドキュメント、先頭の空白は無視する
  text = <<~TEXT
    I love Ruby.
    Python is a great language.
    Java and JavaScript are different.
  TEXT
end

# 原文
puts regex_test_language
#=>
# I love Ruby.
# Python is a great language.
# Java and JavaScript are different.

# 先頭が大文字、かつ小文字が続く文字列のみを抜き出す
# scan (String) - Rubyリファレンス
# https://ref.xaio.jp/ruby/classes/string/scan
# 引数として渡した正規表現に一致する文字列のみを抜き出す
p regex_test_language.scan(/[A-Z][A-Za-z]+/)
#=> ["Ruby", "Python", "Java", "JavaScript"]

# --- 郵便番号を「-」付きで出力する
def regex_test_zip_code
  text = <<~TEXT
    私の郵便番号は1234567です。
    僕の住所は6770056 兵庫県西脇市板波町1234だよ。
  TEXT
end

# 原文
puts regex_test_zip_code

# 郵便番号に「-」を追加する
# gsub, gsub! (String) - Rubyリファレンス
# https://ref.xaio.jp/ruby/classes/string/gsub
# 正規表現に一致する文字列を、指定した文字列に置換する
puts regex_test_zip_code.gsub(/(\d{3})(\d{4})/, '\1-\2')
# 以下でも同じ意味
puts regex_test_zip_code.gsub(/([0-9]{3})([0-9]{4})/, '\1-\2')
