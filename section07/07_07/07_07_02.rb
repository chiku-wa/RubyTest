#encoding: utf-8
# ===
# === 7.7.2 privateメソッド
#
class User
  # ここから下のメソッドはprivateメソッドになる
  private

  def hello
    puts "Hello!"
  end
end

# privateメソッドなので外部から呼び出すことはできない
# user.hello
#=> undefined local variable or method `user' for main:Object (NameError)

# ただし、この挙動を正しく説明すると「レシーバを使ってprivateメソッドを呼び出そうとしてエラー
# になっている」である

# クラス内部からの呼び出しであっても、レシーバを使うと同一のエラーが発生する
class User2
  def hello
    # selfを付けると、レシーバ経由の呼び出しになるためエラーになる
    # puts self.format_name("Tom") #=> private method `format_name' called for #<User2:0x00007f9ad7848950> (NoMethodError)

    # selfを付けなければエラーにならない
    puts format_name("Tom")
  end

  # プラベートメソッド
  private

  def format_name(name)
    "#{name}さん"
  end
end

user2 = User2.new
user2.hello
