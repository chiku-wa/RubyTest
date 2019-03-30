#encoding: utf-8
# ===
# === 7.6.7クラスメソッドの継承
#
class Foo
  def self.hello
    puts "Hello!"
  end
end

class Bar < Foo
end

# クラスを継承すると、サブクラスからスーパークラスのクラスメソッドを呼び出すことができる
Bar.hello #=> Hello!
