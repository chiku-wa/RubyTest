#encoding: utf-8
# ===
# === 7.7.5 privateメソッドから先に定義する場合
class User
  private

  # >>>>privateメソッドの領域
  def hello_private1
    puts "Hello!Private2."
  end

  # <<<<

  # >>>>publicメソッドの領域
  public

  def hello_public
    puts "Hello!Public."
  end

  # <<<<

  private

  # >>>>privateメソッドの領域
  def hello_private2
    puts "Hello!Private2."
  end

  # <<<<
end

user = User.new
# user.hello_private1 #=> private method `hello_private1' called for #<User:0x00007f85a2030d48> (NoMethodError)
user.hello_private1 #=> private method `hello_private1' called for #<User:0x00007feec8040560> (NoMethodError)
user.hello_public
