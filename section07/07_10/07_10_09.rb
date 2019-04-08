#encoding: utf-8
# ===
# === 7.10.9 ダックタイピング

# 引数のオブジェクトがnameメソッドを持つことを期待している
def display_name(object)
  puts "Object name is <<<#{object.name}>>>"
end

class Product
  def name
    "Pacific Rim"
  end
end

class User
  def name
    "Tom"
  end
end

# UserクラスとProductクラスは無関係だが、nameメソッドを持っているため呼び出し可能
product = Product.new
display_name(product) #=> object name is <<<Pacific Rim˜>>>

user = User.new
display_name(user) #=> object name is <<<Tom>>>

# Rubyでは抽象クラスというものが存在しない
# あえてそれっぽく書くと以下の通り。
# Productクラスは抽象クラスとして定義…したつもり
class Product
  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_text
    # サブクラスでstock?メソッドを必ず実装してもらう想定
    # サブクラスのstock?メソッドの結果を吸い上げて出力する
    stock = stock? ? "あり" : "なし"
    "商品名：#{@name}, 値段：#{@price}, 在庫：#{stock}"
  end

  # 引数省略の抽象メソッドはRubyでは定義できないため、抽象メソッドの役割を担うメソッドが直接
  # 呼ばれた場合は、サブクラスに抽象クラスを定義する必要がある旨をエラーとして出力する
  # ※Javaなどでは本来コンパイルの段階で検知されるエラーを、手動で定義する
  def stock?
    # raiseは意図的にエラーを発生させる
    raise "Must implement 'stock?' in subclass"
  end
end

# implementsの代わりに継承を使う
class DVD < Product
  # 内部的にはdisplay_textが継承されている

  def stock?
    # 在庫を確認する処理
    true
  end
end

# Productクラスのstock?メソッドで定義したエラーが表示される
product = Product.new("Pacific Rim", 1000)
# product.display_text #Must implement 'stock?' in subclass (RuntimeError)

# サブクラスはstock?メソッドが定義されているのでエラーにならない
dvd = DVD.new("Toy Story", 1000)
puts dvd.display_text #=> 商品名：Toy Story, 値段：1000, 在庫：あり

# ===
# === Column1
# オブジェクトのクラスを確認するのはinstance_of?メソッド、継承関係を確認するのは
# is_a?メソッドがあるが、メソッドが存在するかを確認するメソッドにrespond_to?メソッドがある
s = "Tom"

# Stringオブジェクトにsizeメソッドが存在するかを確認する
puts s.respond_to?(:size) #=> true

# Stringオブジェクトにnameメソッドが存在することを確認する
puts s.respond_to?(:name) #=> false

# ===
# === Column2

# 引数の数値 or 数字に10を加えて返す
def add_ten(num)
  num.to_i + 10
end

puts add_ten(1) #=> 11
puts add_ten("20") #=> 30

# 引数の値を加算して返す
def add_numbers(a = 0, b = 0)
  a + b
end

puts add_numbers(100) #=> 100
puts add_numbers(99, 1) #=> 100
