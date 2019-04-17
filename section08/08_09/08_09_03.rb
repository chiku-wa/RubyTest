# encoding: utf-8
# ===
# === 8.9.3 prependでモジュールをミックスインする

module A
  def to_s
    "<A> #{super}"
  end
end

class Mammals
  prepend A

  def to_s
    "<Mammals> #{super}"
  end
end

# prepentキーワードでモジュールをミックスインすると、クラスより先にモジュールのメソッドが呼び出される
mammals = Mammals.new
p mammals.to_s #=> "<A> <Mammals> #<Mammals:0x00007fe1ff80ce68>"
p Mammals.ancestors #=> [A, Mammals, Object, Kernel, BasicObject]

class User
  include A

  def to_s
    "<User> #{super}"
  end
end

# includeすると、クラスのメソッドが先に呼ばれる
user = User.new
p user.to_s #=> "<User> <A> #<User:0x00007f8ff7807e18>"
p User.ancestors #=> [User, A, Object, Kernel, BasicObject]
