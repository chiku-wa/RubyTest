# encoding: utf-8
# ================================
# 6.5 正規表現オブジェクトについてもっと詳しく
# ================================
def section_06_05_01
  # ===
  # === 6.5.1 正規表現オブジェクト
  # 正規表現は「//」で囲む以外の方法もある。
  # ---1.Regexp.newでオブジェクトを生成
  p Regexp.new('\d{3}-\d{4}') #=> /\d{3}-\d{4}/

  # ---2.%rで囲む方法
  # 区切り文字「!」の場合
  p %r!\d{3}-\d{4}! #=> /\d{3}-\d{4}/
  # 区切り文字「{}」の場合
  p %r{\d{3}-\d{4}} #=> /\d{3}-\d{4}/
  # %rで囲むと、「/」をエスケープする必要がなくなる
  p %r!http://example\.com! #=> /http:\/\/example\.com/

  # 「/」と「%r」で囲む方法では式展開が可能
  separator = "-"
  p /\d{3}#{separator}\d{4}/ #=> /\d{3}-\d{4}/
  p %r@\d{3}#{separator}\d{4}@ #=> /\d{3}-\d{4}/
end

section_06_05_01

# ===
# === 6.5.2 case文で正規表現を使う
def section_06_05_02
  # 正規表現をcase文のwhen句で使うことも可能
  text = "123-4567"

  case text
  when /\d{2}-\d{4}-\d{4}/
    puts "電話番号です"
  when %r!d{4}/\d{2}/\d{2}!
    puts "日付です"
  when /\d{3}-\d{4}/
    puts "郵便番号です"
  end
end

section_06_05_02

# ===
# === 6.5.3 正規表現オブジェクト作成時のオプション
def section_06_05_03
  # 正規表現オブジェクトの後ろにオプションを付けることもできる
  # 書式
  # /正規表現/オプション

  p "HELLO" =~ /hello/ #=> nil

  # iオプション→大文字小文字区別なし
  p "HELLO" =~ /hello/i #=> 0
  # %rでも可能
  p "HELLO" =~ %r@hello@i #=> 0
end

section_06_05_03

# ===
# === 6.5.4 組み込み変数でマッチの結果を取得する
def section_06_05_04
  # Rubyでは「$」と呼ばれる組み込み変数が存在し、「=~」や「match」の実行結果が格納される
  # [復習]
  # =~ マッチした文字列の位置を返す
  # match マッチした文字列をMatchDataオブジェクトとして返す
  birthday = "私の誕生日は1980年5月30日です"

  # 比較を行う
  birthday =~ /(\d{4})年(\d{1,2})月(\d{1,2})日/

  # 「$~」は、MatchDataオブジェクトを取得する
  p $~ #=> #<MatchData "1980年5月24日" 1:"1980" 2:"5" 3:"30">

  # 「$&」は、マッチした部分をすべて取得する
  p $& #=> 1980年5月30日

  # 1〜3番目のキャプチャを取得する
  p $1 #=> 1980
  p $2 #=> 5
  p $3 #=> 30

  # 最後のキャプチャを取得する
  p $+  #=> 30

  # とはいえ、可読性の意味でもmatchメソッドの実行結果をそのまま用いるほうが可読性が高い
  res = birthday.match(/(\d{4})年(\d{1,2})月(\d{1,2})日/)

  # $~ と同じ意味
  p res

  # $& と同じ意味
  p res[0] #=> 1980年5月30日
  # res.to_sでも同様

  # $n と同じ意味
  p res[1] #=> 1980
  p res[2] #=> 5
  p res[3] #=> 30

  # $+ と同じ意味
  p res[-1] #=> 30
end

section_06_05_04

# ===
# === 6.5.5 Regexp.last_matchでマッチの結果を取得する
def section_06_05_05
  # Regexp.last_matchを使うと、先ほどの組み込み変数と同様に、最後に実行した「=~」やmatch
  # メソッドの結果を返す
  text = "私の誕生日は2000年1月23日、住居の郵便番号123-4567"
  regex_zip_code = /(\d{3})-(\d{4})/
  regex_ymd = /(\d{4})年(\d{1,2})月(\d{1,2})日/

  text =~ regex_zip_code
  text =~ regex_ymd # こちらの結果がRegexp.last_matchに格納される

  # $~ と同じ意味
  p Regexp.last_match #=> #<MatchData "2000年1月23日" 1:"2000" 2:"1" 3:"23">

  # $& と同じ意味
  p Regexp.last_match(0) #=> 2000年1月23日

  # $n と同じ意味
  p Regexp.last_match(1) #=> 2000
  p Regexp.last_match(2) #=> 1
  p Regexp.last_match(3) #=> 23

  # $+ と同じ意味
  p Regexp.last_match(-1) #=> 23
end

section_06_05_05

# ===
# === 6.5.6 組み込み変数を書き換えないmatch?メソッド
def section_06_05_06
  # Ruby2.4で追加されたmatch?メソッド(一致したかをtrue,falseで返す)では、組み込み変数や
  # Regexp.last_matchの結果を書き換えない
  text = "私の誕生日は2003年4月30日、住居の郵便番号999-8888"

  regex_zip_code = /(\d{3})-(\d{4})/
  regex_ymd = /(\d{4})年(\d{1,2})月(\d{1,2})日/

  text.match(regex_zip_code)
  text.match?(regex_ymd) #=> ←の結果は組み込み変数や、Revexp.last_matchに格納されない

  p $& #=> 999-8888
  p Regexp.last_match(0) #=> 999-8888

  # この他にも、RegexpクラスやMatchDataクラスには多くの機能が用意されているため、
  # 下記のドキュメントを参照すること

  # Regexpクラス
  # https://docs.ruby-lang.org/ja/latest/class/Regexp.html

  # MatchDataクラス(結果を格納するクラス)
  # https://docs.ruby-lang.org/ja/latest/class/MatchData.html

end

section_06_05_06
