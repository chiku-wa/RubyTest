#encoding: utf-8
# ===
# === 7.6.5 superでスーパークラスのメソッドを呼び出す
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
