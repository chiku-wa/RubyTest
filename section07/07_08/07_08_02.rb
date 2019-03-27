#encoding: utf-8
# ===
# === 7.8.2 定数はミュータブルなオブジェクトに注意する
class Product
  NAME = "A Product"
  SOME_NAMES = ["Foo", "Bar", "Baz"]
  SOME_PRICES = { :Foo => 100, :Bar => 200, :Baz => 300 }
end

# 再代入以外にも定数を書き換える手段は存在する。
# 定数は破壊的に書き換えることが可能。

# 文字列を大文字に変換する
# ※Stringはミュータブルなオブジェクトなので破壊的メソッドで書き換え可能。
Product::NAME.upcase!
puts Product::NAME #=> A PRODUCT

# 配列を追加することも可能
Product::SOME_NAMES << "Hoge"
p Product::SOME_NAMES #=> ["Foo", "Bar", "Baz", "Hoge"]

#ハッシュにキーと値を追加する
Product::SOME_PRICES[:Hoge] = 1000
p Product::SOME_PRICES #=> {:Foo=>100, :Bar=>200, :Baz=>300, :Hoge=>1000}

# 上記の例はわかりやすいが、以下の要な場合は書き換えた事に気づかない場合がある
class Product2
  SOME_ATTR = ["foo", "bar", "baz"]
  SOME_ATTR_FREEZ = ["foo", "bar", "baz"].freeze

  # 引数を指定した場合、elm変数に定数値が格納される
  def self.attr_with_foo(attr = SOME_ATTR)
    attr.delete("bar")
  end
  # 定数に対してfreezメソッドを使用すると変更できないようにすることができる
  def self.attr_with_baz(attr = SOME_ATTR_FREEZ)
    attr.delete("baz")
  end
end

# 変数を経由して配列を削除すると、もととなった定数も書き換わる
p Product2::SOME_ATTR #=> ["foo", "bar", "baz"]
Product2.attr_with_foo
p Product2::SOME_ATTR #=> ["foo", "baz"]

# freezメソッドを使用した定数は破壊的に変更できない
# Product2.attr_with_baz #=> can't modify frozen Array (FrozenError)

class Product3
  # 配列にfreezeメソッドを使うと配列の追加や削除などは防げるが、配列の要素に対する変更は防げない
  SOME_ATTR = ["foo", "bar", "baz"].freeze
  # 要素1つ1つに対してfreezeする必要がある
  SOME_ATTR_FREEZE_ELMENT = ["foo".freeze, "bar".freeze, "baz".freeze].freeze
  # ★上記の記法は冗長なので、以下の記法が便利
  # 詳しくは「4.4.5 &とシンボルを使ってもっと簡潔に書く」
  # SOME_ATTR_FREEZE_ELMENT = ["foo", "bar", "baz"].map(&:freeze).freeze

  def self.upper_attr
    SOME_ATTR[0].upcase!
  end

  def self.upper_attr_freeze
    SOME_ATTR_FREEZE_ELMENT[0].upcase!
  end
end

# 要素は変更できてしまう
p Product3::SOME_ATTR #=> ["foo", "bar", "baz"]
Product3.upper_attr
p Product3::SOME_ATTR #=> ["FOO", "bar", "baz"]

# 各要素に対してfreezeすれば変更を防げる
p Product3::SOME_ATTR_FREEZE_ELMENT #=> ["foo", "bar", "baz"]
# Product3.upper_attr_freeze #=> can't modify frozen String (FrozenError)
