#encoding: utf-8
# ===
# === 7.10.2 メソッドの削除
class User
  def hello
    puts "Hello!"
  end

  # 自分で定義したメソッドを削除する
  undef hello

  # もともとRubyに存在するメソッドも削除できる
  # 暗黙的にスーパークラスから継承したto_sメソッドを削除する
  undef to_s
end

user = User.new
# puts user.hello #=> undefined method `hello' for #<User:0x00007fa35a82c5a8> (NoMethodError)
# user.to_s #=> undefined method `to_s' for #<User:0x00007fd34a930a88> (NoMethodError)
