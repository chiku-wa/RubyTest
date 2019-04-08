# encoding: utf-8
# ===
# === 8.5.3 Enumerableモジュール

# 配列やRangeなどの繰り返し処理や範囲に関連するクラスは、Enumerableモジュールをincludeしている
p Array.include?(Enumerable) #=> true
p Hash.include?(Enumerable) #=> true
p Range.include?(Enumerable) #=> true

# =====
# ===== Enumerableモジュールが実装しているメソッド
# 代表的なメソッドは以下の通り
# ---
# ---配列
animals = ["dog", "cat", "monkey"]
# mapで、ブロック内で処理した結果を配列として返す
p animals.map { |animal| animal.upcase } #=> ["DOG", "CAT", "MONKEY"]
# selectでブロックの条件に一致する要素をすべて返す
p animals.select { |animal| /.+o.+/ === animal } #=> ["dog", "monkey"]
# findでブロックの条件に一致する要素を1つだけ返す
p animals.find { |animal| /.+o.+/ === animal } #=> "dog"
# countで要素数を返す
p animals.count #=> 3

# ---
# --- ハッシュ
currencies = { japan: :yen, us: :dollar, india: :rupee }
p currencies.map { |key, val| "#{key} => #{val.upcase}" } #=> ["japan => YEN", "us => DOLLAR"]
p currencies.select { |key, val| val.size > 4 } #=> {:us=>:dollar, :india=>:rupee}
p currencies.find { |key, val| val.size > 4 } #=> {:us,:dollar} ※戻り値が1要素なら、キーと値が格納された配列が返ってくる

# ---
# --- 範囲
rnge = (1..3)
p rnge.map { |num| num * 100 } #=>[100, 200, 300]
p rnge.count #=>3

# =====
# ===== Enumerableが実装しているメソッドを利用する方法
class User
  # 条件①：Enumerableモジュールをincludeすること
  include Enumerable

  attr_accessor :names

  def initialize(names)
    @names = names
  end

  # 条件②：eachメソッドを実装すること
  def each
    @names.each
  end
end

user = User.new(["Tom", "Cacy", "Alice"])
# mapメソッドを呼び出すことができる
p user.names.map { |name| name.upcase } #=>["TOM", "CACY", "ALICE"]
