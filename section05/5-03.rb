# encoding: utf-8
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
