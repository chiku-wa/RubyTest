#encoding: utf-8
require_relative "./Product.rb"
# ===
# === 7.6.6 メソッドのオーバーライド
class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  # nameとpriceはProductクラスでオーバーライドしているため、superと書くことでスーパークラス
  # にある同名メソッド(Productクラスのto_sメソッド)を呼び出す。
  def to_s
    "#{super}, 再生時間：#{@running_time}"
  end
end

dvd = DVD.new("Toy Story", 3800, 90)
puts dvd.to_s
#=>
# 作品名：Productクラスのto_sメソッド, 価格：999
# 作品名：Toy Story, 価格：3800, 再生時間：90
# ※DVDクラスを生成すると、継承されたProductクラスが呼び出されるため、クラスファイル内に記され
#   ているputsも呼び出されたため、1行目のような出力が行われる。

# このように、オーバーライドを利用することで、サブクラスにはスーパークラスで定義されていない
# 差分のみを定義するだけで済む。
