# encoding: utf-8
# ===
# === 8.9.5 有効範囲を限定できるrefinements Column

# 通常、「::」はクラスやモジュールの区切りや定数で使われることが多い
module Loggable
  class SystemLog
    PREFIX = "[LOG]"

    def log(text)
      puts "#{PREFIX}#{text}"
    end
  end
end

# ①区切り文字としての用途：モジュール→クラスの呼び出し
# ②定数の呼び出し
puts Loggable::SystemLog::PREFIX #=> [LOG]

system_log = Loggable::SystemLog.new
system_log.log("System reboot.") #=> [LOG]System reboot.

# 「::」でもメソッドは呼び出せる
system_log::log("Double colon") #=> [LOG]Double colon

# クラスやモジュールに限らず、通常のオブジェクトでも同様に「::」で呼び出し可能
str = "test"
puts str::upcase #=> TEST

# ただし、「.」は「::」と同じ機能を持つわけではない
# 「.」の右辺は必ずメソッドであることが期待される

# 定数の呼び出し
puts Loggable::SystemLog::PREFIX #=> [LOG]
# puts Loggable::SystemLog.PREFIX #=>undefined method `PREFIX' for Loggable::SystemLog:Class (NoMethodError)
