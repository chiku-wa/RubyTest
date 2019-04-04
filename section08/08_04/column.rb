# encoding: utf-8
# ===
# === Column
country = "US"
currencies = { "japan" => "yen", country => "dollar" }

# freezeされている
p currencies[0].frozen? #=> true
p currencies[1].frozen? #=> true

# もととなった文字列変数はハッシュのキーとして使われた時点でコピーされて別物になる
# country変数は、キーとなった時点で別物となる
p currencies.keys[1].equal?(country) #=> false
