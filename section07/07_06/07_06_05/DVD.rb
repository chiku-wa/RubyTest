#encoding: utf-8
# ===
# === 7.6.5 superでスーパークラスのメソッドを呼び出す
require_relative "./Product.rb"

class DVD < Product
  # name,priceはスーパークラスで定義済みなので定義不要
  attr_reader :running_time

  def initialize(name, price, running_time)
    # スーパークラスのinitializeメソッドはsuperで呼び出すことができる
    super(name, price)

    # 以下の呼び出し方は誤りなのでNG
    # クラスメソッドの呼び出しを意味し、通常のinitializeの呼び出しとは異なる
    # 詳しくは後述
    # super.initialize(name, price)

    # 以下の記述は可能だが、重複してしまうのでおすすめしない
    # @name=name
    # @price=price

    @running_time = running_time
  end
end

dvd = DVD.new("Toy Story3", 3800, 90)
puts dvd.name
puts dvd.price
puts dvd.running_time
