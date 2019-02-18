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

# === 5.3 シンボル
def section_05_03
  # シンボルとは、文字列と似ているオブジェクトだが、実態としては別物。
  # [シンボルの定義方法]
  # :<シンボル名>
  puts :japan #=> japan
  p :japan #=> :japan # pメソッドだと「:」付きで出力される

  # === 5.3.1 シンボルと文字列の違い
  # classが異なる
  p :japan.class #=> Symbol
  p "japan".class #=> String

  # [シンボルの特徴]
  # * Ruby内部では整数として扱われている
  # * シンボルのほうが高速
  # * 同じ名称のシンボルは、全て同じオブジェクトとして扱われる
  #   →そのため、同じ名称のオブジェクトをいくつ作ってもメモリの使用効率が良い

  # いくつ作っても、同じオブジェクトID
  p :apple.object_id #=> 1027228
  p :apple.object_id #=> 1027228
  p :apple.object_id #=> 1027228

  # 異なるオブジェクトIDが払い出される
  p "apple".object_id #=>70252390077060
  p "apple".object_id #=>70252390076980
  p "apple".object_id #=>70252390076900

  # シンボルはイミュータブルなので、破壊的な変更は不可能
  # 文字列は破壊的に変更可能
  string = "apple"
  p string.upcase! #=> APPLE

  symbol = :banana
  # symbol.upcase! #=> undefined method `upcase!' for :banana:Symbol (NoMethodError)

  # 5.3.2 シンボルの特徴とおもな用途
  # シンボルの特徴
  # ① 表面上は文字列のようなのでプログラマが扱いやすい
  # ② 内部的には整数なので、PCで高速に処理できる
  # ③ 同じシンボルは同じオブジェクトなので、メモリの使用効率が良い
  # ④ イミュータブルなので、値が勝手に書き換えられる心配がない

  # 「ソースコード上で名前を識別させたいが、名前が必ずしも文字列である必要がない」場合に
  # よく用いられる。
  # 代表的なのがハッシュのキーである。

  currenncies_string = {"japan" => "yen", "us" => "dollar", "india" => "rupee"}
  p "string: #{currenncies_string["japan"]}"

  # シンボルを使うと、高速に値を取り出すことができる
  currenncies_symbol = {:japan => "yen", :us => "dollar", :india => "rupee"}
  p "string: #{currenncies_symbol[:japan]}"

  # 他にも、オブジェクトが持っているメソッド名がシンボルだったりする
  p "apple".methods #=> [:encode!, :include?, :%, :*, :+, :count, :partition, :to_c ...
  p :apple.methods #=> [:match, :match?, :<=>, :to_sym, :to_proc, :==, :===, ...
end

section_05_03
