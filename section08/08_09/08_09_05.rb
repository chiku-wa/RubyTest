# encoding: utf-8
# ===
# === 8.9.5 有効範囲を限定できるrefinements

# StringShuffleモジュールを定義し、Stringクラスに対してshuffleメソッドを追加定義し、使用範囲を限定する
module StringShuffle
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end

class Mammals
  # usingで先ほど定義したメソッドを使用可能にする
  using StringShuffle

  def initialize(name)
    @name = name
  end

  def shuffle_name
    # usingしているため、Stringインスタンスのshuffleメソッドを使用できる
    @name.shuffle
  end
end

# refineでスコープを限定しているため、トップレベルで使用することはできない
# puts "Cacy".shuffle #=> undefined method `shuffle' for "Cacy":String (NoMethodError)

# Mammalsクラスのshuffle_nameメソッドを介してのみ、shuffleメソッドを使用できる
mammals = Mammals.new("Piggy")
puts mammals.shuffle_name #=> gPiyg

# ===
# === なお、トップレベルでusingを使用した場合は、有効範囲は「usingを使用したところを開始地点として、ファイルの末尾まで」

# この時点ではまだ使えない
# puts "Tom".shuffle #=> undefined method `shuffle' for "Tom":String (NoMethodError)

using StringShuffle

# usingを使用したので、有効範囲がファイルの末尾まで拡張される
puts "Tom".shuffle #=> oTm

# クラスの配下も対象となる
class Product
  def self.shuffle_name(name)
    name.shuffle
  end
end

puts Product.shuffle_name("Toy Story") #=> yr StyooT
