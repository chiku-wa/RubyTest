# encoding: utf-8
# ===
# === 8.7.3 モジュールに定数を定義する
module Loggable
  PREFIX = "[INFO]".freeze

  def log(text)
    puts "#{PREFIX}#{text}"
  end
end

puts Loggable::PREFIX #=> [INFO]
