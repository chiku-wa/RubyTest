#encoding: utf-8
# ===
# === 11.3 よく発生する例外クラスとその要因

# === 11.3.1 NameError
# DateクラスをrequireせずにDateクラスを使用
# Date.class #=> uninitialized constant Date (NameError)

# === 11.3.2 NoMethodError
# 文字列ではなくシンボルに対してcharsメソッドを呼び出そうとした
# p :fruits.chars #=>  undefined method `chars' for :juso:Symbol (NoMethodError)

# === 11.3.3 TypeError
# Integerクラスの「+」メソッドには文字列を渡せないためエラーとなる
# p 1 + "2" #=> String can't be coerced into Integer (TypeError)
# 内部的には以下と同じ
# p 1.+("1")

# レシーバを入れ替えるとエラーが変わる
# Stringクラスの「+」メソッドには数値を渡せないためエラーとなる
# p "1".+(1) #=> no implicit conversion of Integer into String (TypeError)

# === 11.3.4 ArgumentError
# メソッドに渡す引数が不正な場合にエラーとなる。

# deleteメソッドには引数が必須だが、引数を渡さずに実行しようとする
# [1, 2, 3].delete #=> wrong number of arguments (given 0, expected 1) (ArgumentError)
