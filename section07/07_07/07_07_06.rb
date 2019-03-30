#encoding: utf-8
# ===
# === 7.7.6 あとからメソッドの公開レベルを変更する場合
class User
  # foo,barはpublicメソッドとして定義し、あとからprivateメソッドに切り替える
  # bazメソッドはpublicメソッドのまま

  # 一旦publicメソッドとして定義
  def foo
    puts "foo"
  end

  def bar
    puts "bar"
  end

  # foo,barメソッドをprivateに変更
  private :foo, :bar
  # ちなみにprivateメソッドの引数はシンボルでなくて文字列でもOK
  # private "foo", "bar"

  # bazはpublicのまま
  def baz
    puts "baz"
  end
end

user = User.new
# user.foo #=> private method `foo' called for #<User:0x00007fc62f024688> (NoMethodError)
# user.bar #=> undefined local variable or method `bar' for User:Class (NameError)

user.baz #=> baz
