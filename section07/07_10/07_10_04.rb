#encoding: utf-8
# ===
# === 7.10.4 演算子の挙動を独自に再定義する
class User
  # 「=」で終わるメソッドを定義する
  # 「=」メソッド
  def name=(value)
    @name = value
  end
end

user = User.new
# 一見代入に見えるが、「name=」はメソッド名！
user.name = "Alice"
user.name = ("Alice")

# 「==」を使用するメソッドを再定義する
# まずは==を再定義していないクラスで挙動確認
class Product
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
  end
end

prdct1 = Product.new("A-001", "DVD")
prdct2 = Product.new("A-002", "Food")
prdct3 = Product.new("A-001", "DVD")

# Productクラスのcodeが一致すればtrueになるように==を再定義する
p prdct1 == prdct2 #=> false
p prdct1 == prdct3 #=> true
#=> このままだと、Objectクラスの「==」メソッドが呼び出されるため、object_idで比較してしまう

# 「==」を再定義する
class ProductRedefine
  attr_reader :code, :name

  def initialize(code, name)
    @code = code
    @name = name
  end

  def ==(other)
    # 引数のクラスが、このクラスと同じの場合、codeが同じ値であればtrue、そうでないならfalse
    if other.is_a?(ProductRedefine)
      code == other.code
    else
      false
    end
  end
end

prdct_r1 = ProductRedefine.new("A-001", "DVD")
prdct_r2 = ProductRedefine.new("A-002", "Food")
prdct_r3 = ProductRedefine.new("A-001", "DVD")

puts "------"
p prdct_r1 == prdct_r2 #=> false
p prdct_r1 == prdct_r3 #=> true
# ProductRedefineオブジェクト以外を引数に渡してもfalseになる
p prdct_r1 == "A-001" #=> false

puts "------"
# メソッドなので、以下と同じ意味
p prdct_r1.==(prdct_r2) #=> false
p prdct_r1.==(prdct_r3) #=> true

# 左辺と右辺を逆にすると左辺のオブジェクトのメソッドが呼び出されるため、再定義した==は呼び出されない
# 以下の場合はStringクラスの==メソッドが呼び出される。
p "A-001" == prdct1 #=> false
