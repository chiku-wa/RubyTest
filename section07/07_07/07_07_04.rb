#encoding: utf-8
# ===
# === 7.7.4 クラスメソッドをprivateにしたい場合

# クラスメソッドは「private」の下に記述してもprivateにならず、別の記法で書く必要がある。
# 2通りの記述方法がある。
# * ①class << self
# * ②private_class_methodを用いる
class User
  # ①class << self
  class << self
    private

    def hello_private1
      puts "Hello!Private class << self."
    end
  end

  # ②private_class_methodでprivateにするクラスメソッドを指定する
  def self.hello_private2
    puts "Hello!Method for private_class_method."
  end
  private_class_method :hello_private2

  # インスタンスメソッドと同じように、privateの下にクラスメソッドを定義してもprivateにならない
  private

  def self.hello_public
    puts "Hello!Public."
  end
end

# privateメソッドとして扱われるためエラーになる
# User.hello_private1 #=> private method `hello_private1' called for User:Class (NoMethodError)
User.hello_private2 #=> private method `hello_private2' called for User:Class (NoMethodError)

User.hello_public #=> Hello!Public.s
