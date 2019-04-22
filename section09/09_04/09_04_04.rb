# encoding: utf-8
require "date"

# ===
# === 9.4.4 例外処理よりも条件分岐を使う

# 9.4.3 のプログラムを条件分岐でエラーチェックする形にする

def convert_heisei_to_date(heisei_text)
  m = heisei_text.match(/平成(?<jp_year>\d+)年(?<jp_month>\d+)月(?<jp_day>\d+)日/)
  year = m[:jp_year].to_i + 1988
  month = m[:jp_month].to_i
  day = m[:jp_day].to_i

  if Date.valid_date?(year, month, day)
    Date.new(year, month, day)
  end
end

p convert_heisei_to_date("平成31年4月22日") #=> #<Date: 2019-04-22 ((2458596j,0s,0n),+0s,2299161j)>

p convert_heisei_to_date("平成31年99月99日") #=> nil
