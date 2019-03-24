#encoding: utf-8
# ===
# === 7.6.5 superでスーパークラスのメソッドを呼び出す
require_relative "./Product.rb"

class DVDSameInitMethod < Product
  attr_reader :running_time

  def initialize(name, price)
    # superと書くと、スーパークラスと同じメソッドを呼び出す。
    # もしスーパークラスとサブクラスで引数の数が同じだった場合、引数を省略することで、引数すべてを
    # 暗黙的に渡すことができる
    # つまりsuper(name, price)と書いたのと同じ意味
    super

    # ただし、super()とすると、引数なしのinitializeメソッドを呼び出す意味となる
    # 今回例としたProductクラスには引数なしのinitializeメソッドは存在しないためエラーとなる
    # super()
    #=> `initialize': wrong number of arguments (given 0, expected 2) (ArgumentError)
  end
end

dvd_sim = DVDSameInitMethod.new("Toy Story", 1000)
puts dvd_sim.name
puts dvd_sim.price
