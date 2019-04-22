# encoding: utf-8
require "date"

# ===
# === 9.4.3 例外処理の対象範囲と対象クラスを極力絞りこむ

# ---
# --- 悪い例
# 「平成X年X月X日」形式の文字列をDateインスタンスとして返すメソッド
def convert_heisei_to_date(heisei_text)
  begin # 補足する範囲が広く、例外が発生しない処理もbeginで囲ってしまっている

    # 正規表現のキャプチャ機能を使って、正規表現に一致した文字列を配列に格納
    m = heisei_text.match(/平成(?<jp_year>\d+)年(?<jp_month>\d+)月(?<jp_day>\d+)日/)
    year = m[:jp_year].to_i + 1988
    month = m[:jp_month].to_i
    day = m[:jp_day].to_i
    Date.new(year, month, day) # 実際に例外が発生しうるのはこの処理のみ
  rescue => e # 補足するクラスが絞り込まれておらず、予期せぬ異常もすべてrescueしてしまう
    puts "例外クラス：#{e.class} 例外メッセージ：#{e.message}"
    puts e.backtrace

    # 無効な日付であればnilを返す
    nil
  end
end

# 例外は発生しうるパターンを引数として渡す
convert_heisei_to_date("平成31年99月99日")

# 後述のサンプルプログラムのために一旦メソッドをクリア
undef convert_heisei_to_date

puts "========================="

# ---
# --- 良い例

def convert_heisei_to_date(heisei_text)
  # 正規表現のキャプチャ機能を使って、正規表現に一致した文字列を配列に格納
  m = heisei_text.match(/平成(?<jp_year>\d+)年(?<jp_month>\d+)月(?<jp_day>\d+)日/)
  year = m[:jp_year].to_i + 1988
  month = m[:jp_month].to_i
  day = m[:jp_day].to_i

  begin
    # 実際に例外が発生しうる箇所のみbeginで囲む
    Date.new(year, month, day)
  rescue ArgumentError => e #Dateクラスへの変換で失敗するのはArgumentErrorであるため、絞り込んで補足
    puts "例外クラス：#{e.class} 例外メッセージ：#{e.message}"
    puts e.backtrace

    # 無効な日付であればnilを返す
    nil
  end
end

convert_heisei_to_date("平成31年99月99日")
