#encoding: utf-8
# ===
# === 7.10.8 クラスメソッドは特異メソッドの一種

# クラスメソッドと特異メソッドは記法が似ている。
# 比較として以下の通り表現する。

# --- クラスメソッド
# 通常の定義方法
class User
  # def 自身の名前.メソッド名
  def self.hello
    puts "Hello"
  end

  # class << 自身の名前
  class << User
    def konnichiwa
      puts "こんにちは"
    end
  end
end

# クラスの外部でもクラスメソッドを定義できる。特異メソッドと似ている。
# def 自身の名前.メソッド名
def User.hi
  puts "Hi"
end

# class << 自身の名前
class << User
  def ohayou
    puts "おはよう"
  end
end

User.hello #=> hello
User.konnichiwa #=> こんにちは
User.hi #=> Hi
User.ohayou #=> おはよう

# --- 特異メソッド
alice = "Alice."

# 自身の名前.メソッド名
def alice.hello
  puts "Hello!#{self}"
end

class << alice
  def konnichiwa
    puts "こんにちは！#{self}"
  end
end

alice.hello #=> Hello!Alice
alice.konnichiwa #=> こんにちは！Alice
