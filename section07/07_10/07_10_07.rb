#encoding: utf-8
# ===
# === 7.10.7 特異メソッド

alice = "I am alice."
bob = "I am bob."

# オブジェクト名.メソッド名　でオブジェクトにメソッドを定義できる
# 定義方法には以下の2通りある

# ①
def alice.shuffle
  chars.shuffle.join
end

# ②
class << alice
  def hello
    # selfで自分自身を呼び出すことができる
    "Hello!#{self}"
  end
end

puts alice.shuffle #=> i. eaaIlmc
puts alice.hello #=> Hello!I am alice.

# bobオブジェクトにはhelloが定義されていないためエラーになる
# bob.shuffle #=> undefined method `hello' for "I am bob.":String (NoMethodError)

# ただし、即値(プリミティブ)は特異メソッドを定義できない
# 数値
num = 1
# def num.hello
# end
#=> can't define singleton (TypeError)

symbol = :Tom
# def symbol.bar
# end
#=> can't define singleton (TypeError)
