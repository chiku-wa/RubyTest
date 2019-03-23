#encoding: utf-8
# ===
# === 7.5.1 selfをつけて不具合が発生するケース
# 7.5で紹介したように、Getterとして使う場合は以下のいずれの方法で変数を呼び出しても挙動は
# 変わらない。
# ①self.をつけて呼び出す
# ②インスタンス変数として呼び出す
# ③変数を直接指定する
#
# ただし、Setterとして使う場合は異なってくる
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # --- ①selfあり
  def rename_to_bob
    self.name = "Bob"
  end

  # --- ②インスタンス変数
  def rename_to_alice
    @name = "Alice"
  end

  # --- ③selfなし
  def rename_to_cacy
    # ★この場合、ローカル変数nameを定義したものとみなされるため、インスタンス内部の変数は
    # セットされない！
    name = "Cacy"
  end
end

user = User.new("Tom")
puts user.name #=> Tom

user.rename_to_bob
puts user.name #=> Bob

user.rename_to_alice
puts user.name #=> Alice

user.rename_to_cacy
puts user.name #=> Alice ★値が書き換わらない！
