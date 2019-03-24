#encoding: utf-8
# ===
# === 7.6.7クラスメソッドの継承
#
# クラスを継承すると、スーパークラスが持っているメソッドをサブクラスが使うことができる
class Foo
  def self.hello
    puts "Hello!"
  end
end

class Bar < Foo
end

Bar.hello #=> Hello!
