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

  def name_upcase
    @@name.upcase
  end
end

# クラス直下で定義されている変数を呼び出し
# クラスを呼び出した時点で「Product」で初期化される
puts Product.name #=> Product
puts DVD.name #=> DVD

# インスタンスメソッドで@@nameを書き換える
product = Product.new("Tom Clancy")
puts product.name #=> Tom Clancy

# クラスから直接呼び出すと@@nameが書き換わっていることを確認できる
puts Product.name #=> Toy Story
# スーパークラスの変更に連動して、サブクラスの@@nameも書き換わっている
puts DVD.name #=> Toy Story

# # サブクラスの変更に連動して、スーパークラスの@@name変数も書き換わっている
# dvd = DVD.new("Toy Story")
# puts dvd.name #=>Toy Story

# dvd.name_upcase
# puts Product.name
