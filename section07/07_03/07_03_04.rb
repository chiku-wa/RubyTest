#encoding: utf-8
# ===
# === 7.3.4 クラスメソッドの定義
# クラス内部に普通にメソッドを定義した場合は「インスタンスメソッド」になり、インスタンス内部の
# インスタンス変数を使うことができる。
#
# 一方、インスタンス変数を用いない場合は「クラスメソッド」を定義したほうが都合が良い。
#
# [書式1]
# def self.クラスメソッド名
#   処理
# end
#
# [書式2] ※一度にたくさんクラスメソッドを定義する場合はこちらが便利
# class << self
#   def クラスメソッド名1
#     処理
#   end
#   def クラスメソッド名2
#     処理
#   end
#   ...
# end
class User
  def initialize(name)
    @name = name
  end

  # --- インスタンスメソッド
  # 普通に定義するとインスタンスメソッドとなる
  def hello
    "Hello,I am #{@name}"
  end

  # --- クラスメソッド
  # [書式1]
  # ★↓のようなメソッドは実際は「特異メソッド」と呼ばれるが、詳細は7.10.8にて
  def self.create_users(names)
    # eachにするとクラスではなく文字列が返ってくるため注意
    names.map do |name|
      User.new(name)
    end
  end

  # [書式2]
  class << self
    def greeting(string)
      "#{string}"
    end

    def foo_bar
      "FooBar"
    end
  end
end

# インスタンスメソッドは、インスタンスに対して呼び出す。
instance = User.new("Tom")
puts instance.hello #=> Hello,I am Tom

# クラスメソッドはインスタンス不要
# [書式1]
names = ["Cacy", "Bob"]
users = User.create_users(names)
users.each do |user|
  puts user.hello
end
#=>
# Hello,I am Cacy
# Hello,I am Bob

# [書式2]
puts User.greeting("Good night!") #=> Good night!
puts User.foo_bar #=> FooBar

# === Column
# ===
# RubyのAPIドキュメントでは、インスタンスメソッドとクラスメソッドを以下の通り表現している。
#
# ①インスタンスメソッド
# クラス名#インスタンスメソッド
# 例：Stringクラスのto_sインスタンスメソッド
# String#to_s
#
# ②クラスメソッド
# クラス名.クラスメソッド もしくは クラス名::メソッド名
# 例：Fileクラスのexistsクラスメソッド
# File.exists?
# File::exists?
