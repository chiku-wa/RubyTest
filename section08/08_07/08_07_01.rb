# encoding: utf-8
# ===
# === 8.7.1 モジュールに特異メソッドを定義する
module Loggable
  # これまで用いた特異メソッドと同じ方法でを定義可能
  # ①selfを用いる
  def self.log(text)
    puts "[LOG]#{text}"
  end

  # ②class < self
  class << self
    def format_date(date)
      "date:#{date}"
    end

    def format_name(method_name)
      "Method name:#{method_name}"
    end
  end
end

puts Loggable.log("Singleton method for module.") #=> [LOG]Singleton method for module.
puts Loggable.format_date("2019/4/13") #=> date:2019/4/13
puts Loggable.format_name("format_name") #=> Method name:format_name
