# encoding: utf-8
# ===
# === 8.5.2 include先のメソッドを使うモジュール
module Toggable
  # 呼び出し先のpriceメソッドを呼び出す
  def prict_tag
    "#{price}円"
  end

  # 内部的には以下のようにselfが付与された時と同じ挙動
  # ここでいうselfは、モジュール自身という意味ではなく、include先のクラス(Product)自身という
  # 意味になるため。
  def format_price
    "￥#{self.price}"
  end
end

class Product
  include Toggable

  def price
    1980
  end
end

product = Product.new
puts product.price #=> 1980

# モジュールからpriceメソッドを呼び出すことができた
puts product.prict_tag #=> 1980円

# selfあり
puts product.format_price #=> ￥1980
