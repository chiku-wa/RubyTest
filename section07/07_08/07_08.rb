#encoding: utf-8
# ===
# === 7.8 定数についてもっと詳しく
class Product
  DEFAULT_PRICE = 0

  # 定数をprivateメソッドにすることもできる
  DEFAULT_NAME = "<なし>"
  private_constant :DEFAULT_NAME
  # 以下でも同じ意味。
  # private_constant "DEFAULT_NAME"

  # メソッドの中に定数はを宣言することはできない
  def defined_constant
    # DEFAULT_WEIGHT=0
    #=>
    # dynamic constant assignment DEFAULT_WEIGHT=0
  end
end

puts Product::DEFAULT_PRICE #=> 0

# private定数なので外部から参照できない
# puts Product::DEFAULT_NAME #=> private constant Product::DEFAULT_NAME referenced (NameError)
