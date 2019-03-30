#encoding: utf-8
# ===
# === 7.9.1 クラスインスタンス変数
class Product
  # --- クラスインスタンス変数
  # クラス直下で宣言しているので、クラスインスタンス変数
  @name = "Product"

  def self.name
    @name
  end
  # ----

  # --- インスタンス変数
  def initialize(name)
    @name = name
  end

  def name
    # attr_readerと記せばよいが、クラスインスタンス変数との違いを比較しやすいようにGetterを
    # 明示的に定義
    @name
  end

  # ----
end

# クラスインスタンス変数とインスタンス変数は別の変数として扱われる

product = Product.new("Toy Story")
puts product.name #=> Toy Story

puts Product.name #=> Product

# インスタンス変数はスーパークラスからサブクラスへそのまま受け継がれるが、
# クラスインスタンス変数は、スーパークラスとサブクラスで個別に管理される。
class DVD < Product
  # スーパークラスのProductと同じ変数nameだが、実体は個別管理
  @name = "DVD"

  def self.name
    @name
  end

  # スーパークラスと同じinitializeメソッドなら、メソッド自体を省略できる

  def upcase_name
    # スーパークラスから継承したインスタンス変数を大文字に変換
    # スーパークラスで継承しているのでGetterは不要
    @name.upcase
  end
end

puts Product.name #=> Product

product = Product.new("Tom Clancy")
puts product.name #=>Tom Clancy

puts DVD.name #=> DVD

dvd = DVD.new("Toy Story")
puts dvd.upcase_name #=> TOY STORY
