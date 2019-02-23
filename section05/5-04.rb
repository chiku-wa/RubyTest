#encoding: utf-8
# ================================
# 5.4 続・ハッシュについて
# ================================
def section_05_04
  # ===
  # === 5.4.1 ハッシュのキーにシンボルを使う
  # シンボルをキーとして使う場合、「=>」の代わりに、「:」変数の右側に記述することができる
  currencies = {japan: "yen", us: "dollar", india: "rupee"}
  # 値を取り出すときは「=>」のときと同様
  puts currencies[:japan] #=> yen

  # 値をシンボルにする場合は「:文字」の形式のまま
  # キーと値がシンボルの場合は以下のとおりとなる
  currencies = {japan: :yen, us: :dollar, india: :rupee}
  puts currencies[:india] #=> rupee

  # Rubyでは、キーをシンボルとして扱う(=>を使わない)方が記述が簡単なため使われることが多い。
  # ため慣れておくこと

  #=== 5.4.2 キーや値に異なるデータ型を混在させる
  # --- ハッシュのキーには異なるデータ型が混在できるが、できる限りデータ型を揃えるのが好ましい
  h = {"japan" => "yen", population: 100_000_000}

  # 取り出す時はキーの型を揃える必要がある
  puts h["japan"] #=> yen
  puts h[:population] #=> 100000000

  # 取り出すキーの型が違うと出力できない
  puts h["population"]
  puts h[:japan]

  # --- ただし、値の型が混在するのはよくあるため問題なし
  person = [
    # 数値
    age: 30,
    # 文字
    name: "John",
    # 配列
    friends: ["Bob", "Tom"],
    # ハッシュ
    phones: {home: "00-0000-0000", mpbile: "090-1111-1111"},
  ]
  puts person
  #=>
  # {
  #   :age=>30
  #   , :name=>"John"
  #   , :friends=>["Bob", "Tom"]
  #   , :phones=>{:home=>"00-0000-0000", :mpbile=>"090-1111-1111"}
  # }

end

section_05_04

# ===
# === 5.4.3 メソッドのキーワード引数とハッシュ
# キーワード引数(引数にハッシュを用いること)で、その引数の意味合いがわかりやすくなる
def buy_burger(menu, drink, potato)
  p menu
  p "drink" if drink
  p "potato" if potato
end

# そのままだと、なんの引数かわかりにくい
# チーズバーガー、飲み物あり、ポテトなし
buy_burger("cheese", true, false)

# ---
# --- キーワード引数にデフォルト値を設定している場合
# 引数をハッシュにすることで、引数の意味合いがわかりやすくなる
def buy_burger_hash_default(menu, drink: true, potato: true)
  p menu
  p "drink" if drink
  p "potato" if potato
end

# 呼び出す時はキーを記述する必要がある
buy_burger_hash_default("double", drink: true, potato: true)

# ハッシュにデフォルト値を定義しているので、引数を省略することもできる
buy_burger_hash_default("teriyaki", drink: true)
buy_burger_hash_default("beef")

# キーワード引数は、順番を入れ替えることもできる
buy_burger_hash_default("fish", potato: false, drink: true)

# 存在しないキーワード引数を指定した場合はエラーになる
# buy_burger_hash_default("chicken", salad: true) #=> unknown keyword: salad (ArgumentError)

# ---
# --- キーワード引数にデフォルトを指定しない場合
def buy_burger_hash_non_default(menu, drink:, potato: true)
  p menu
  p "drink" if drink
  p "potato" if potato
end

buy_burger_hash_non_default("pork", drink: true)

# デフォルト値がないキーワード引数を省略するとエラーになる
# buy_burger_hash_non_default("pork") #=> missing keyword: drink (ArgumentError)

# ---
# --- キーワード引数のメソッドを呼び出す場合は、キーワード引数をハッシュにして渡す事ができる
params = {potato: true, drink: false}
buy_burger_hash_non_default("beef", params)

# もちろん、変数を介さなくてもOK
buy_burger_hash_non_default("beef", {potato: true, drink: false})

# ★これはNGなので注意！単なるハッシュなので、引数を1つとしてみなしてしまう！★
# buy_burger_hash_non_default("beef", {"potato" => true, "drink" => false})
#=> wrong number of arguments (given 2, expected 1; required keyword: drink) (ArgumentError)
