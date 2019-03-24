# encoding: utf-8
# ===
# === 7.3.3 インスタンス変数とアクセサメソッド
class User
  # --- インスタンス変数
  # クラス内部でのみ使える、クラス内部で共有できる変数のこと。
  # インスタンス変数は「@」で始まる変数名を持つ。
  def initialize(name)
    # インスタンス変数「name」を定義
    @name = name
  end

  # 定義したインスタンス変数は、同一のクラス内で共有できる
  def hello_instance_var
    puts "Hello, I am #{@name}"

    # インスタンス変数はローカル変数とは異なり、変数宣言のみでもエラーにならない
    # この場合はnilが格納される
    # 【注意】変数名をタイプミスしても気づきにくい！
    puts "#{@age} years old." #=>  years old
  end

  # --- ローカル変数
  def hello_local_var
    # ローカル変数は代入が必須であり、宣言のみはNG
    # shuffle_name  #=> undefined local variable or method `shuffle_name'

    # shuffle_nameはこのメソッド内でのみ有効
    shuffle_name = @name.chars.shuffle.join
    puts shuffle_name
  end

  # インスタンス変数は外部からは直接参照できないため、Getterを定義する必要がある
  def name
    @name
  end

  # Setterは、Ruby特有の表記法で定義する
  # def 変数名=(引数)
  #   @インスタンス変数名 = 引数
  # end
  def name=(value)
    @name = value
  end
end

user = User.new("Tom")

# インスタンス変数を使用したメソッドの呼び出し
user.hello_instance_var #=> Hello, I am Tom

# ローカル変数
user.hello_local_var #=> omT ※Tomの文字をシャッフルしたもの

# インスタンスのGetter,Setter
user.name = "Bob"
puts user.name #=> Bob

# Setter,Getterとして単に読み書きさせたいだけであれば、「attr_XXX」メソッドを1つ記すだけで済む
# カンマ区切りで複数指定することもできる
class UserAttr
  # 読み書きを許容する
  attr_accessor :first_name, :last_name

  # 読み込みのみを供する
  attr_reader :age

  # 書き込みのみを許容する
  attr_writer :weight

  def initialize(first_name, last_name, age, weight)
    @first_name = first_name
    @last_name = last_name
    @age = age
    @weight = weight
  end
end

user_attr = UserAttr.new("Tarou", "Yamada", 20, 50)
# attr_accessor読み書き可能
user_attr.first_name = "Watson"
puts user_attr.first_name #=> Watson
user_attr.last_name = "John"
puts user_attr.last_name #=> John

# attr_readerなので、書き込しようとするとエラーになる
# user_attr.age = 19 #=> undefined method `age=' for #<User:0x00007f8deb876420 @name="Watson"> (NoMethodError)
puts user_attr.age  #=> 20

# attr_writerなので、読み込もうとするとエラーになる
user_attr.weight = 90
# puts user_attr.weight #=> undefined method `weight' for #<UserAttr:0x00007fe5ae82b658> (NoMethodError)

# ===
# === Culumn
# 同一のクラス名を定義した場合、一から作成し直されるわけではなく、既存の定義に追加される形になる
class DuplicateUser
  def hello
    "Hello!"
  end
end

class DuplicateUser
  def bye
    "Bye!"
  end
end

user = DuplicateUser.new
# 先に定義したHello!も出力される
puts user.hello #=> Hello!
puts user.bye #=> Bye!
