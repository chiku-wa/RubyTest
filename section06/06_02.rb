# encoding: utf-8

# ===
# === 6.2.2 正規表現をゼロから学習するための参考資料
# 正規表現を学び直すため、伊藤淳一さんのQiitaの記事をもとにサンプルを作成する。
#
# 正規表現のテストには以下のサイトを利用。
# Rubular: a Ruby regular expression editor
# https://rubular.com/

# --------------
# 初心者歓迎！手と目で覚える正規表現入門・その１「さまざまな形式の電話番号を検索しよう」 - Qiita
# https://qiita.com/jnchito/items/893c887fbf19e17d3ff9
#---------------
def regex_test_01
  # 「\d」は任意の数字を意味するメタ文字という([0-9]と同じ意味)

  text = <<~TEXT
    名前：伊藤淳一
    電話：03-1234-5678
    電話：090-1234-5678
    電話：0795-12-3456
    電話：04992-1-2345
    住所：兵庫県西脇市板波町1-2-3
  TEXT

  # まずはセンスのないメタ文字を連続させた形から
  regex_tel = /\d\d-\d\d\d\d-\d\d\d\d/
  puts text.scan(regex_tel).join("|")
  #=>
  # 03-1234-5678 | 90-1234-5678 →部分的にしか抜き出せていない！

  # 多くの電話番号のパターンに対応させるために、正規表現を見直す。要件は以下の通りとする。
  # [半角数字が2〜5桁]-[半角数字が1〜4個]-[半角数字が4個]
  regex_tel_multi = /\d{2,5}-\d{1,4}-\d{4}/
  puts text.scan(regex_tel_multi).join("|")
  # => 03-1234-5678|090-1234-5678|0795-12-3456|04992-1-2345

  # しかし、この場合だと電話番号がハイフンの代わりに「()」で囲まれている場合に対応できない
  text_enclosed = <<~TEXT
    名前：伊藤淳一
    電話：03(1234)5678
    電話：090-1234-5678
    電話：0795(12)3456
    電話：04992-1-2345
    住所：兵庫県西脇市板波町1-2-3
  TEXT
  puts text_enclosed.scan(regex_tel_multi).join("|")
  #=>
  # 090-1234-5678|04992-1-2345

  # よって、[]を用いて判定を行う
  # [AB]…AもしくはBのいずれかが存在する
  #   例：[-(] 　→　「-」、もしくは 「(」が存在する
  regex_tel_enclosed = /\d{2,5}[-()]\d{1,4}[-)]\d{4}/
  puts text_enclosed.scan(regex_tel_enclosed).join("|")
  #=> 03(1234)5678|090-1234-5678|0795(12)3456|04992-1-2345

  # ★「-」の注意点
  # 「[]」の中の順番はどのようにしても問題はない。例えば[AB]と[BA]は同じ意味を指す。
  # ただし、[A-B]とすると、ABのいずれか、という意味になる。もし「A or B or -」を表現したい場合は
  # AB-
  # BA-
  # -AB
  # ...
  # といった具合に、後ろか前にハイフンを置くこと

end

regex_test_01

#---------------
# 初心者歓迎！手と目で覚える正規表現入門・その２「微妙な違いを許容しつつ置換しよう」 - Qiita
# https://qiita.com/jnchito/items/64c3fdc53766ac6f2008
#---------------
def regex_test_02
  text = <<~TEXT
    クープバゲットのパンは美味しかった。
    今日はクープ バゲットさんに行きました。
    クープ　バゲットのパンは最高。
    ジャムおじさんのパン、ジャムが入ってた。
    また行きたいです。クープ・バゲット。
    クープ・　バゲット
    クープ・バケットのパン、売り切れだった（><）
  TEXT

  # 半角スペース、全角スペース、「・」を許容する
  regex = /クープ[ 　・]バゲット/
  puts text.scan(regex)
  #=>
  # クープ バゲット
  # クープ　バゲット
  # クープ・バゲット

  # しかしこのままだと続けて「クープバゲット」と入力された場合に検知できない。
  # 量定子を用いて、「1文字、もしくは文字なし」の条件を付与する。
  # 量指定子：「?」「*」のように、文字数を指定するための識別子のこと
  regex_question = /クープ[ 　・]?バゲット/
  puts text.scan(regex_question)
  # クープバゲット →★区切り文字がなくても検知される！
  # クープ バゲット
  # クープ　バゲット
  # クープ・バゲット

  # ◾キャプチャ
  # 「()」で囲うことで、それぞれの正規表現をキャプチャという塊で括ることができる
  # x番目のキャプチャを参照する場合は「$x」や「\x」という表現を用いて抽出する

  # キャプチャの例
  html = <<~TEXT
    <select name="game_console">
    <option value="none"></option>
    <option value="wii_u" selected>Wii U</option>
    <option value="ps4">プレステ4</option>
    <option value="gb">ゲームボーイ</option>
    </select>
  TEXT

  # ◾メタ文字
  # \d → [0-9]と同義
  # \w → [0-9A-Za-z]と同義(半角英数字)

  # option要素をCSV形式にする、ただし要素が無いものはカンマを出力しない。
  # gsub：第一引数に正規表現、第二引数に正規表現で指定したキャプチャを指定する。
  # \1 → 1つめのキャプチャを取得
  # \2 → 2つめのキャプチャを取得
  # ※第二引数はシングルクォートで囲むこと！ダブルクォートだとうまく動かない！
  puts html.gsub(
    /<option value="(\w+)"(?: selected)?>(.*)<\/option>/, # 「*?」を使うと、()で囲ってもキャプチャとみなされない(単にグルーピングしたいだけならこれを使う)
    '\1,\2' # カンマ区切り
  )
  #=>
  # <select name="game_console">
  # none,
  # wii_u,Wii U
  # ps4,プレステ4
  # gb,ゲームボーイ
  # </select>

  # 「*」や「+」は、貪欲な量指定子と呼ばれ、マッチングした文字列の中で、"最も文字列が長いもの(最後の見つかったもの)"
  # を採用する。
  # 先ほどの文字列を1行で定義して再度正規表現にかけてみる
  html_one_line = '<select name="game_console"><option value="none"></option><option value="wii_u" selected>Wii U</option><option value="ps4">プレステ4</option><option value="gb">ゲームボーイ</option></select>'
  puts html_one_line.gsub(
    /<option value="(\w+)"(?: selected)?>(.*)<\/option>/, # (ABC)? は、「文字列ABCがある or 文字列なし」を意味する。()で囲うとその中のすべての文字列を意味する。
    '\1,\2'
  )
  #=>
  # <select name="game_console">none,</option><option value="wii_u" selected>Wii U</option><option value="ps4">プレステ4</option><option value="gb">ゲームボーイ</select>
  # →「(.*)」の条件ゆるすぎるため、<option>が複数出現しても、1つの塊としてみなされている！

  # これを回避するには以下の解決策がある。

  # ①否定形である「^」を用いて、ストッパーとして機能させる
  # 例：[^AB] → AでもBでもない"任意の1文字"
  # 「(.*)」を、「[^<]*」に書き換えることにより、タグが検知されなくなる
  puts html_one_line.gsub(
    /<option value="(\w+)"(?: selected)?>([^<]*)<\/option>/,
    '\1,\2'
  )

  # ②両指定子の貪欲さを抑制する
  # 「+?」「*?」といったように、量指定子の次に「?」を置くことで、"最も文字列が短いもの(最初に見つかったもの)"
  # という動きに切り替わる(貪欲さを失う)。
  puts html_one_line.gsub(
    /<option value="(\w+)"(?: selected)?>(.*?)<\/option>/,
    '\1,\2'
  )
end

regex_test_02
