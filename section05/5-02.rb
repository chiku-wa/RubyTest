# encoding: utf-8
require "Benchmark" # 実行時間の計測に使うためのライブラリ
# ================================
# 5.2 ハッシュ
# ================================
def section_05_02
  # ハッシュのクラス名を確認
  puts { }.class #=> Hash

  # 定義方法
  # {キー名1 => 値1, キー名2 => 値2...}
  {
    "Japan" => "yen",
    "us" => "dollar",
    "india" => "rupee",
  }

  # 同じキーが複数使われた場合は、最後に定義されたものが優先される
  # ★ただし、意図的に使うことはまずない
  h = {
    "Japan" => "yen",
    "Japan" => "円",
  }
  puts h #> 円

  # === 5.2.1 要素の追加、変更、取得
  # 要素の追加
  currenncies = {"japan" => "yen", "india" => "rupee", "us" => "dollar"}
  currenncies["italy"] = "euro"
  puts currenncies #=> {"japan" => "yen", "india" => "rupee", "us" => "dollar", "italy"=>"euro"}

  # すでにキーが存在する場合は上書きされる
  currenncies["japan"] = "円"
  puts currenncies #=> {"japan" => "円", "india" => "rupee", "us" => "dollar", "italy"=>"euro"}

  # 値を取り出す
  currenncies = {"japan" => "yen", "india" => "rupee", "us" => "dollar"}
  p currenncies["japan"] #=> "yen"

  # キーが存在会しない場合はnilが返る
  p currenncies["brazil"] #=> nil

  # === 5.2.2 ハッシュを使った繰り返し処理
  currenncies = {"japan" => "yen", "india" => "rupee", "us" => "dollar"}
  # ブロックの第一引数がキー、第二引数が値として取り出せる
  currenncies.each do |key, value|
    p "#{key}, #{value}"
  end
  #=>
  # "japan", "yen"
  # "india", "rupee"
  # "us", "dollar"

  # ブロック引数が1つだけだと、配列として渡される
  currenncies.each do |key_value|
    p key_value
  end
  #=>
  # ["japan", "yen"]
  # ["india", "rupee"]
  # ["us", "dollar"]

  # === 5.2.3 ハッシュの同値比較、要素数の取得、要素の削除
  a = {"x" => 1, "y" => 2, "z" => 3}
  b = {"x" => 1, "y" => 2, "z" => 3}

  # すべてのキーと値が一致していればTrueになる
  p a == b #=> True

  # 順番が異なっていてもTrue
  c = {"y" => 2, "x" => 1, "z" => 3}
  p a == c #=> True

  # キーxの値が異なるためFalse
  d = {"x" => 10, "y" => 2, "z" => 3}
  p a == d #=> False

  # sizeメソッドで長さを取得できる
  # ★putsでエラーになるため()で囲む
  p ({}).size #=> 0
  puts ({"x" => 10, "y" => 2, "z" => 3}).size #=> 3

  # deleteメソッドで要素を削除できる
  # 戻り値は、削除された要素の「値」
  currenncies = {"japan" => "yen", "india" => "rupee", "us" => "dollar"}
  puts currenncies.delete("japan") #=> "yen"
  p currenncies #=> {india" => "rupee", "us" => "dollar"}

  # deleteメソッドで指定したキーが存在しない場合はnilが返る
  p currenncies.delete("brazil") #=> nil

  # ブロックを使うと、見つからないときの戻り値をカスタマイズできる
  p currenncies.delete("italy") { |key| "Not found #{key}" } #=> Not found italy
end

section_05_02
