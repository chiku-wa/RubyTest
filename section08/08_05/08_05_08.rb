# encoding: utf-8
# ===
# === 8.5.8 モジュールとインスタンス変数

# nameインスタンス変数を書き換えるメソッドを定義する
module NameChanger
  def name_change
    @name = "ありす"
  end
end

# self.Setterメソッド名 で値を呼び出すことで、インスタンス変数(Setterメソッド)が存在しない場合はエラーが発生するようにする
module WeightChanger
  def change_weight
    self.weight = 100
  end
end

class User
  include NameChanger

  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Animal
  include NameChanger
  include WeightChanger

  attr_accessor :tag

  def initialize(tag)
    @tag = tag
  end
end

user = User.new("Alice")
p user.name #=>Alice

# モジュールでインスタンス変数を書き換える
user.name_change
p user.name #=>ありす

# ただし、クラスに該当するインスタンス変数がなくてもエラーが発生しないため、モジュールにインスタンス変数を用いるのは得策ではない
animal = Animal.new("pig")
p animal.tag #=>pig
# 内部的には@name変数の値に「ありす」が設定されており、エラーにもならない
animal.name_change

# Setterメソッドを用いることで、該当するSetter(インスタンス変数)が存在しない場合はエラーになるため、
# あらぬバグが混入するリスクを避けられる。
# エラーに出力されている「=(value)」はSetterメソッドを指している
# animal.change_weight #=> undefined method `weight=' for #<Animal:0x00007fcf5a823df0 @tag="pig", @name="ありす"> (NoMethodError)
