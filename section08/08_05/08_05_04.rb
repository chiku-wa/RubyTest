# encoding: utf-8
# ===
# === 8.5.4 Comparableモジュールと<=>演算子

# ===
# === <=>演算子(メソッドの挙動確認)
# 1. a > bなら、差を正の整数を返す
# 2. aとbが等しいなら0を返す
# 3. a < bなら、差を負の整数を返す
# 4. aとbが比較できないならnilを返す
p 2 <=> 1 #=> 1
p 2 <=> 2 #=> 0
p 1 <=> 2 #=> -1
p "a" <=> 2 #=> nil

# 文字でも比較が可能、文字コードの大小で比較される
p "xyz" <=> "abc" #=> 1 ※アルファベットが後ろにある方が文字コードも大きいため、正の整数が返ってくる
p "abc" <=> "abc" #=> 0
p "abc" <=> "xyz" #=> -1
p "abc" <=> 123 #=> nil

# ===
# === 独自のクラスを定義してComparableモジュールのメソッドを使用する
class Human
  include Comparable

  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 前述の「4. aとbが比較できないならnilを返す」を満たすために、比較対象は双方とも同一の
  # オブジェクト、もしくは継承関係である場合ことを条件とする
  def <=>(other_human)
    # インスタンスメソッド配下ではselfはインスタンスを指すため、クラスを特定したい場合は「class」メソッドを呼ぶこと
    if other_human.is_a?(self.class)
      # <=> メソッドをそのまま実装する
      @weight <=> other_human.weight
    else
      nil
    end
  end
end

# Humanクラスには<=>メソッドが実装されているため、< <= ==  => > between? メソッドが使用できる
tom = Human.new("Tom", 60)
alice = Human.new("Alice", 59)
cacy = Human.new("Cacy", 55)

# 内部的には「tom.==(alice)」というメソッド呼び出しが行われている
p tom == alice #=> false

p tom >= alice #=> true

# between?の使い方
#between? (Comparable) - Rubyリファレンス
# https://ref.xaio.jp/ruby/classes/comparable/between
# > obj.between?(min, max)
p alice.between?(cacy, tom) #=> true

# <=>を実装したことで、sortメソッドも使用できる。
# 体重が軽い順番に並び替える。
humans = [alice, cacy, tom]
p humans.map { |human| human.weight } #=> [59, 55, 60]
humans.sort!
p humans.map { |human| human.weight } #=> [55, 59, 60]
