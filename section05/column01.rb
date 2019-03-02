# encoding: utf-8
# ================================
# Column
# ================================

# ===
# === Column メソッド定義時の順番

# 今までの学習で、メソッドの引数には様々な種類が存在することがわかった
# ◾通常の引数 ※デフォルト引数なし
#   def method(country)
#
# ◾デフォルト引数ありの引数
#   def method(country="japan")
#
# ◾可変長引数(受け取った引数は配列)
#   def method(*countries)
#
# ◾キーワード引数
#   def method(country: ["japan"])
#
# ◾**を使った、任意の数のキーワード引数
#   def method(country, **other)
#
# ◾(未学習)&を使ったブロックを受け取る引数

# これらの引数を組み合わせて使用する場合、以下の順序で使用することが決められている。
# ①通常の引数
# ②デフォルト値ありの引数
# ③可変長引数(1度だけ使用可能)
# ④通常の引数
# ⑤キーワード引数
# ⑥**を使った任意のキーワード引数(1度だけ使用可能)
# ⑦&を使ったブロックを受け取る引数(1度だけ使用可能)

# 例えば以下の場合はエラーにならない
def puts_car_spec(name, price = 0, *options, weight, mileage: 0, **others, &block)
  puts "[通常の引数]"
  puts name

  puts "[デフォルト値ありの引数]"
  puts price

  puts "[可変長引数]"
  puts options

  puts "[通常の引数]"
  puts weight

  puts "[キーワード引数]"
  puts mileage

  puts "[**を使った任意のキーワード引数]"
  puts others

  puts "[&を使ったブロック引数]"
  puts block
end

puts_car_spec("Benz", 1000000, "GPS", "ETC", "1.7t", mileage: 100, other1: "Tax in", other2: "Made in Germany") { 99 }

# 実際の現場では、こういった複雑な引数構成は避けるべきだが、どうしても混在させる必要が出てきた
# 場合はこの順序性を覚えておくこと。
