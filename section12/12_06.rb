#encoding: utf-8
# ===
# === 12.6 eval、バッククォートリテラル、sendメソッド

# --- evalメソッド
cmd = 'puts ["B", "C", "D"].inject("A"){|res, n| res + n}'
eval(cmd) #=> ABCD

# --- バッククォートリテラル
puts `pwd` #=> 〜/section12
puts `ls ./`
#=>
#  12_02.rb
#  12_03.rb
#  12_03_FileUtilsTest.txt
#  12_04.rb
#  12_04_test.csv
#  12_04_test.tsv
#  12_05.rb
#  12_06.rb

# --- sendメソッド
fruits = ["apple", "banana", "melon"]
# 第一引数に実行させたいメソッドの名前を、第二引数以降はそのメソッドに渡す引数を指定する
puts fruits.send("join", "★")
#=> apple★banana★melon
