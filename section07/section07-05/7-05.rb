#encoding: utf-8
# ===
# === 7.5 selfキーワード
# インスタンスそのものを指す場合にselfキーワードを用いる。
# 内部の変数やメソッドを呼び出す場合に明示的に「self.」を先頭に付ける。
#
# 変数の呼び出し方法には以下の3つのパターンがある。
# ①self.をつけて呼び出す
# ②インスタンス変数として呼び出す
# ③変数を直接指定する
#
# ここでは、①〜③のパターンでGetterを使用した場合の挙動の変化について説明する。
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # --- ①selfあり
  def hello
    "Hello!#{self.name} for with self."
  end

  # --- ②インスタンス変数
  def bye
    "Bye!#{@name} for instance variable."
  end

  # --- ③selfなし
  def good_night
    "Good night!#{name} for non self"
  end
end

user = User.new("Tom")
puts user.hello # Hello!Tom for with self.
puts user.bye # Bye!Tom for instance variable.
puts user.good_night # Good night!Tom non self
