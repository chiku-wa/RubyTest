#encoding: utf-8
# ===
# === 7.7.7 protectedメソッド
class User
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 引数のUserオブジェクトより重い場合はtrue
  def heavier_than?(other_user)
    @weight > other_user.weight
  end
end

tom = User.new("Tom", 80)
bob = User.new("Bob", 81)

# そのままだと、weightメソッドはgetterが存在しないためエラーとなる
# puts tom.heavier_than?(bob) #=> undefined method `weight' for #<User:0x00007f8fe9830f88 @name="Bob", @weight=81> (NoMethodError)

# しかしweightをpublicとして公開してしまうと外部からも参照できてしまうため、heavier_than?メソッド
# で比較する場合のみ参照させたい場合は、attr_XXXを使わずに、protected付きでgetterを定義する。
# ※attr_XXXの実体は、publicのgetter,setter

class UserForProtected
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 引数のUserオブジェクトより重い場合はtrue
  def heavier_than?(other_user)
    @weight > other_user.weight
  end

  # protectedで定義された場合は、同一のクラス、もしくはサブクラスのインスタンスメソッドからのみ呼び出せる
  protected

  def weight
    @weight
  end
end

cacy = UserForProtected.new("Cacy", 50)
alice = UserForProtected.new("Alice", 40)

# aliceオブジェクトとcacyオブジェクトは、同じUsewrForProtectedクラスなのでweightを参照できる
puts cacy.heavier_than?(alice) #=> true

# protectedで定義されたGetterは、同一のクラス、もしくはサブクラスでしか参照できないため、
# 外部からは見えない
# puts cacy.weight #=> protected method `weight' called for #<UserForProtected:0x00007fb1f2817968 @name="Cacy", @weight=50> (NoMethodError)
