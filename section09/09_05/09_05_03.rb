# encoding: utf-8
# ===
# === 9.5.3 文字入力を受け付けるgetsメソッド

# getsメソッドで、ユーザの入力を受け付ける
input = gets
# 改行文字も変数として受け取ってしまう
p input #=> "あ\n"

# chompメソッドで、改行を取り除く
input = gets.chomp
p input #=> "あ"
