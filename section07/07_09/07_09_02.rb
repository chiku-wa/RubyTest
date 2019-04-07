#encoding: utf-8
# ===
# === 7.9.2 クラス変数
class Product
  @@name = "Product"

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD < Product
  @@name = "DVD"

  def self.name
    @@name
  end

  # スーパークラスと同じinitializeメソッドなら、メソッド自体を省略できる

  def name_upcase!
    @@name.upcase!
  end
end

# クラス直下で定義されている変数を呼び出し
# DVDクラスを【定義】した時点で共通変数である@@nameが書き換わってしまう
puts Product.name #=> DVD ※Productではない
puts DVD.name #=> DVD

# インスタンスメソッドで@@nameを書き換える
product = Product.new("Tom Clancy")
puts product.name #=> Tom Clancy

# クラスから直接呼び出しても書き換わったままになっている
puts Product.name #=> Tom Clancy
# サブクラスの@@nameも共通変数なので、スーパークラスと同じく書き換わっている
puts DVD.name #=> Tom Clancy

# サブクラスの変更に連動して、スーパークラスの@@name変数も書き換わっている
dvd = DVD.new("Toy Story")
puts dvd.name #=>Toy Story

# インスタンスメソッドで破壊的にクラス変数を書き換える
dvd.name_upcase!
puts Product.name #=> TOY STORY
