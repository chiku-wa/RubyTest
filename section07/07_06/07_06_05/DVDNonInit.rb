#encoding: utf-8
# ===
# === 7.6.5 superでスーパークラスのメソッドを呼び出す
require_relative "./Product.rb"

class DVDNonInit < Product
  # initializeメソッドがスーパークラスと同じ処理しかしないなら、initalizeメソッドそのものを
  # 省略する方が良い
  # def initialize(name, price)
  #   # スーパークラスのinitializeメソッドはsuperで呼び出すことができる
  #   super
  # end
end

dvd_ni = DVDNonInit.new("Toy Story2", 2000)
puts dvd_ni.name
puts dvd_ni.price
