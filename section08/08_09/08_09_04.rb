# encoding: utf-8
# ===
# === 8.9.4 prependで既存メソッドを置き換える

# ---
# --- prependを用いず、aliasを使ってメソッドにモンキーパッチを当てる
# prependがなかった時は、aliasを用いる必要があった

# このクラスは、外部ライブラリとしてすでに定義されている想定
class Mammals
  def name
    "Animals"
  end
end

mammals = Mammals.new
puts mammals.name #=> Animals

# Mammalsクラスにモンキーパッチをあてるため、Mammalsクラスを再オープンする
class Mammals
  # 元から定義されているnameメソッドを、name_originという別名にする
  alias name_origin name

  def name
    "<<#{name_origin}>>"

    # 単にnameメソッドを呼び出すと、自分自身を呼び出してしまうため、「 stack level too deep」という無限再帰エラーが発生する
    # ※alias定義時は、まだnameメソッド未定義のためエラーにはならなかった
    # "<<#{name}>>"  #=> `name': stack level too deep (SystemStackError)
  end
end

mammals = Mammals.new
puts mammals.name #=> <<Animals>>

# ---
# --- prependでaliasを用いずnameメソッドの挙動を変える
class Car
  def name
    "Sedan"
  end
end

car = Car.new
puts car.name #=> Sedan

module NameDecorator
  # モジュールでsuperと記すと、ミックスインされた先のクラスのnameメソッドが呼び出される
  def name
    "<<#{super}>>"
  end
end

# このクラスは、外部ライブラリとしてすでに定義されている想定
class Car
  prepend NameDecorator
end

car = Car.new
puts car.name #=> <<Sedan>>

# 一度モジュールを定義してしまえば、他のクラスでも流用可能

# 方法①：クラス内部でprependする
# このクラスは、外部ライブラリとしてすでに定義されている想定
class User
  def name
    "Tom"
  end
end

class User
  prepend NameDecorator
end

user = User.new
puts user.name #=> <<Tom>>

# 方法②：クラスに定義されているPrependメソッドを使う
module NameFormatter
  def name
    "Product name is #{super}."
  end
end

class Product
  def name
    "Toy Story3"
  end
end

Product.prepend NameFormatter
product = Product.new
puts product.name #=> Product name is Toy Story3.
