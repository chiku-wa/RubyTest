#encoding: utf-8
# =====
# ===== 10.5.2 &とto_procメソッド

# === &について
# &付きでProcインスタンスを渡すパターン(前章で紹介済み)
proc_upcase = Proc.new { |text| text.upcase }

animals = ["Dog", "Cat", "Bird"]

# &を付けることで、引数をブロックとして認識させることができる
# 本来はこう書かないといけないが…
p animals.map { |text| text.upcase } #=> ["DOG", "CAT", "BIRD"]
# &を付けることで、ブロックとして認識させることができる
p animals.map(&proc_upcase) #=> ["DOG", "CAT", "BIRD"]

# &を付けないとブロックとして認識されないためエラーになる
# p animals.map(proc_upcase)
#=> wrong number of arguments (given 1, expected 0) (ArgumentError)

# === to_procについて
fruits = "Melon,Banana,Grape DORIAN"

# to_procのレシーバにシンボルを指定すると、シンボル名のメソッドが呼び出される
proc_split = :split.to_proc
p proc_split.class #=> Proc

# 第一引数にメソッドのレシーバを、第二引数以降はそのメソッドに渡す引数を指定する
p proc_split.call(fruits, ",") #=> ["Melon", "Banana", "Grape DORIAN"]
# 以下の処理と同義
p fruits.split(",") #=> ["Melon", "Banana", "Grape DORIAN"]

# ただし、ブロックは引数として認識されないため以下の記述はエラーになる
# p animals.map(proc_upcase.to_proc)
#=> wrong number of arguments (given 1, expected 0) (ArgumentError)

# === &: のおまじないの意味
foods = ["sushi", "Fish&Chips", "beer"]

# 以下2つとも同じ意味になる
p foods.map { |s| s.upcase } #=> ["SUSHI", "FISH&CHIPS", "BEER"]
p foods.map(&:upcase) #=> ["SUSHI", "FISH&CHIPS", "BEER"]
