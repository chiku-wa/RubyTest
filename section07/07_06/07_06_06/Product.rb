#encoding: utf-8
# ===
# === 7.6.6 メソッドのオーバーライド
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 自身で定義したクラスは、スーパークラスの頂点であるObjectクラスを継承しているためto_sを持つ
  # Objectクラスのto_sメソッドをオーバーライドして、新たなto_sメソッドを定義する
  def to_s
    "作品名：#{@name}, 価格：#{@price}"
  end
end

product = Product.new("Productクラスのto_sメソッド", 999)
puts product.to_s #=> 作品名：Productクラスのto_sメソッド, 価格：999
