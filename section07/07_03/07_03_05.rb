#encoding: utf-8
# ===
# === 7.3.5 定数
# クラスの中には定数を定義することができる
class Product
  # デフォルトの価格を定数として定義する
  # 先頭が大文字だと自動的に定数として認識されるが、
  # 定数名はすべて大文字、区切り文字は_(アンダーバー)が使われることが多い
  DEFAULT_PRICE = 0

  attr_reader :name, :price

  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end

  # インスタンスメソッド、クラスメソッドからも参照可能
  def default_price
    DEFAULT_PRICE
  end

  def self.default_price
    DEFAULT_PRICE
  end
end

prd = Product.new("Banana")
puts prd.name #=> Banana
puts prd.price #=> 0 ※定数で初期化されたprice属性

# インスタンスメソッド、クラスメソッドから定数を参照
puts prd.default_price #=> 0
puts Product.default_price #=> 0

# インスタンスメソッドで定数を設定することはできない。
PREFIX = "[LOG]"

class Mammals
  def edit_prefix
    # PREFIX="<LOG>"
    #=>
    # dynamic constant assignment
    # PREFIX="<LOG>"
  end
end
