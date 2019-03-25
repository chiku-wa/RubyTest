#encoding: utf-8
# ===
# === 7.7.3 privateメソッドはサブクラスでも呼び出せる

# スーパークラスのprivateメソッドはサブクラスでも呼び出せる
# そしてオーバーライドも可能。
class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 後述のprivateメソッドを呼び出す
  def to_s
    format_name
  end

  private

  def currencies_symbol
    "￥"
  end

  def format_name
    "商品名：#{@name}"
  end
end

class DVD < Product
  # [復習]initializeメソッドは、引数構成がスーパークラスと同じなら省略できる
  # def initialize(name,price)
  #   super
  # end

  # スーパークラスのprivateメソッドを呼び出すことができる
  def format_price
    # スーパークラスのcurrencies_symbolを呼び出す
    "#{currencies_symbol}#{@price}"
  end

  # スーパークラスのprivateメソッドをオーバーライド
  def to_s
    "DVD名: #{name}"
  end
end

product = Product.new("Toy Story", 1000)
puts product.to_s #=> 商品名：Toy Story

dvd = DVD.new("Toy Story2", 2000)
# Productのprivateメソッドである「currencies_symbol」を呼び出すことに成功し、正常に処理される
puts dvd.format_price #=> ￥2000
# サブクラスでオーバーライドされるため、Productのto_sとは出力が変わる
puts dvd.to_s #=> DVD名：Toy Story2
