#encoding: utf-8
# ===
# === 9.6.7 例外処理のbegin/endを省略できるケース
require "date"
# begin/endを省略しない場合
def convert_text_to_date(text)
  begin
    Date.parse(text)
  rescue ArgumentError => e
    puts "#{e.class} #{e.message}"
  end
end

p convert_text_to_date("2019-04-28") #=> #<Date: 2019-04-28 ((2458602j,0s,0n),+0s,2299161j)>
p convert_text_to_date("2019-99-28") #=> ArgumentError invalid date

undef convert_text_to_date

def convert_text_to_date(text)
  Date.parse(text)
rescue ArgumentError => e
  puts "#{e.class} #{e.message}"
end

p convert_text_to_date("2019-04-28") #=> #<Date: 2019-04-28 ((2458602j,0s,0n),+0s,2299161j)>
p convert_text_to_date("2019-99-28") #=> ArgumentError invalid date

# ===
# === Column 二重に例外を発生させないようにしよう
# rescue節の中で例外が発生してしまうと、もともとの例外が判別しにくくなる
def division(lhs, rhs)
  lhs / rhs
rescue => e
  # messageをタイポしたと仮定する
  "#{e.messege}"
end

p division(6, 3) #=> 2

# 例外が補足されず、そのまま例外が発生するため、もともと発生するはずだった例外が特定しにくい。
# p division(3, 0)
#=>
# Traceback (most recent call last):
#         2: from 〜/section09/09_06/09_06_07.rb:39:in `<main>'
#         1: from 〜/section09/09_06/09_06_07.rb:32:in `division'
# 〜/section09/09_06/09_06_07.rb:32:in `/': divided by 0 (ZeroDivisionError)
#         2: from 〜/section09/09_06/09_06_07.rb:39:in `<main>'
#         1: from 〜/section09/09_06/09_06_07.rb:31:in `division'
# 〜/section09/09_06/09_06_07.rb:35:in `rescue in division': undefined local variable or method `e' for main:Object (NameError)

# もともと発生するはずだった例外を特定したい場合は、呼び出し元でcauseメソッドを使って特定する。
begin
  p division(3, 0)
rescue => e
  puts "====rescue節で発生した例外==="
  puts "#{e.class} #{e.message}" #=> NoMethodError undefined method `messege' for #<ZeroDivisionError: divided by 0>
  puts e.backtrace

  # 元の例外を取得する
  e_original = e.cause
  puts "====元の例外==="
  unless e_original.nil?
    puts "#{e_original.class} #{e_original.message}" #=> ZeroDivisionError divided by 0
    puts e_original.backtrace
  end
end
