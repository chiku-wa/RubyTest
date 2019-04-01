#encoding: utf-8
# ===
# === 7.10.6 オープンクラスとモンキーパッチ

# ---
# --- オープンクラス
# ①Stringクラスを継承して独自のクラスを定義する
class MyString < String
  # 任意の実装を記す
end

my_string = MyString.new("Hello!")
puts my_string #=> Hello!

# Stringクラスを継承しているので、Stringのメソッドを使用することもできる
puts my_string.to_s

# ②既存のクラスに独自のメソッドを追加する
# Stringクラスにshuffleメソッドを追加する
class String
  def shuffle
    chars.shuffle.join
  end
end

str = "Hello!Tom!"
puts str #=> Hello!Tom!
puts str.shuffle #=> lomH!!lTeo

# ---
# --- モンキーパッチ
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello!#{@name}!"
  end
end

user = User.new("Cacy")
puts user.hello #=> Hello!Cacy!

# 同名のメソッドを再定義して上書きする(モンキーパッチをあてる)
class User
  # @nameは、前述で定義したUserクラスから自動的に引き継がれる
  def hello
    "こんにちは！#{@name}さん！"
  end
end

user = User.new("Tom")
puts user.hello #=> こんにちは！Tomさん！

# エイリアスを使うことで、上書きしたメソッドの中で、元となったメソッドを呼び出すことができる
class Product
  def initialize(name)
    @name = name
  end

  def format_name
    "Goods name:#{@name}"
  end
end

product = Product.new("Pacific Rim")
puts product.format_name #=> Goods name:Pacific Rim

class Product
  # 元となったメソッド名にエイリアスを設定し、呼び出せるようにする
  alias format_name_original format_name

  def format_name
    "[英語]#{format_name_original}、[日本語]商品名：#{@name}"
  end
end

product = Product.new("Pacific Rim Up Rising")
puts product.format_name #=> [英語]Goods name:Pacific Rim Up Rising、[日本語]商品名：Pacific Rim Up Rising
