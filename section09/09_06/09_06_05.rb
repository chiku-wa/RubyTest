#encoding: utf-8
# ===
# === 9.6.5 begin/endを省略するrescue修飾子
require "date"

# rescue修飾子で例外を補足する
# [構文]
# 例外が起きうる処理 rescue 例外発生時の処理
# ※rubocopの構文チェックには引っかかるため注意

# pなどの出力メソッドを用いる場合は()で囲む必要がある
p (1 / 1 rescue 0) #=> 1
p (1 / 0 rescue 0) #=> 0

# rescue修飾子を用いる場合は補足する例外クラスは指定できない
# p (1 / 0 rescue ZeroDivisionError 0) #=> undefined method `ZeroDivisionError' for main:Object (NoMethodError)

# これを応用して、Dateオブジェクト生成のメソッドを手軽に作成できる

# ---
# --- begin〜endを用いる場合
def generateDateObject(text)
  begin
    Date.parse(text)
  rescue
    nil
  end
end

p generateDateObject("2019-04-28") #=> #<Date: 2019-04-28 ((2458602j,0s,0n),+0s,2299161j)>

p generateDateObject("2019-04-99") #=> nil

undef generateDateObject

# ---
# --- rescue修飾子を用いる場合
def generateDateObject(text)
  Date.parse(text) rescue nil
end

p generateDateObject("2019-04-28") #=> #<Date: 2019-04-28 ((2458602j,0s,0n),+0s,2299161j)>

p generateDateObject("2019-04-99") #=> nil
