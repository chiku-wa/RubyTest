#encoding: utf-8
# ===
# === 9.6.8 rescueした例外を再度発生させる
require "date"

module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

def convert_to_date(text)
  include Loggable

  begin
    Date.parse(text)
  rescue ArgumentError => e
    # 異常終了させたいが、ログを出力してから終了させたい
    log("#{e.class} #{e.message}")

    # 意図的にrescueで捕捉したArgumentErrorを発生させる
    raise
  end
end

p convert_to_date("2019-04-28") #=> #<Date: 2019-04-28 ((2458602j,0s,0n),+0s,2299161j)>

p convert_to_date("2019-13-28")
#=>
# [LOG]ArgumentError invalid date
# Traceback (most recent call last):
#         2: from 〜/section09/09_06/09_06_08.rb:25:in `<main>'
#         1: from 〜/section09/09_06/09_06_08.rb:16:in `convert_to_date'
# 〜/section09/09_06/09_06_08.rb:16:in `parse': invalid date (ArgumentError)
