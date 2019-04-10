# encoding: utf-8
# ===
# === 8.6.1 名前空間を分けて名前の衝突を防ぐ

# 日付を意味するDate
class Date
  def initialize(year, month, day)
    @year = year
    @month = month
    @day = day
  end
end

# 恋人同士のデート
class Date
  def initialize(day, schedule)
    @day = schedule
    @schedule = schedule
  end
end

# クラス名が同名のため衝突が発生してしまった
# 今回の場合は、あとで定義された「恋人同士のデート」が優先されるため、以下のinitializeはエラーになる
# Date.new(2019, 4, 11)

# よって、モジュールを定義した上で、その中に名前の衝突が起きうるクラスを閉じ込めてしまう

# 予定モジュールのDateクラス
class Plan
  class Date
    def initialize(year, month, day)
      @year = year
      @month = month
      @day = day
    end
  end
end

# 恋人モジュールのDateクラス
module Lover
  class Date
    def initialize(day, schedule)
      @day = schedule
      @schedule = schedule
    end
  end
end

# 呼び出す特は
# モジュール名::クラス名で呼び出すことができる
Plan::Date.new(2019, 4, 10)
Lover::Date.new("2019/5/5", ["Movie", "Restaurant"])
