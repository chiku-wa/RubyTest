#encoding: utf-8
# ===
# === 12.2 日付や時刻の扱い

# --- Timeクラス
# requireなしで使用可能

# 2019年5月19日 9:30:00のオブジェクトを作成
time = Time.new(2019, 5, 19, 9, 30, 00)
# Timeクラスのタイムゾーンは、世界標準時から時差がある表記となる(+9:00)
p time  #=> 2019-05-19 09:30:00 +0900

# --- DateTime,Date
# "date"ライブラリにDateTimeクラスとDateクラスが含まれている
require "date"

# datetimeというライブラリはないため注意
# require "datetime"

# 2020年1月15日 10:30:30のオブジェクトを作成
date_time = DateTime.new(2019, 5, 19, 9, 30, 00)
# DateTimeクラスのタイムゾーンは、世界標準時(+0:00)
p date_time #=> #<DateTime: 2019-05-19T09:30:00+00:00 ((2458623j,34200s,0n),+0s,2299161j)>

# 2019年12月31日
date = Date.new(2019, 12, 31)
p date #=> #<Date: 2019-12-31 ((2458849j,0s,0n),+0s,2299161j)>
