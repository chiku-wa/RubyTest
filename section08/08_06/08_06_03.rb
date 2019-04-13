# encoding: utf-8
# ===
# === 8.6.3 ネスト無しで名前空間付きのクラスを定義する

# ネストありの名前空間付きのクラス作成
module Lover
  class Message
    def self.print
      puts "Tom and Alice are Lover."
    end
  end
end

Lover::Message.print

module Mammals
end

class Mammals::Human
  def self.format_name(name)
    puts "My name is #{name}."
  end
end

class Mammals::Animal
  def self.format_name(name)
    puts "This is a #{name}."
  end
end

Mammals::Human.format_name("I am Tom.")
Mammals::Animal.format_name("Pig!")

# ===
# === Column

# モジュールのクラスから、トップレベルの同名クラスを呼び出したい場合は、「::クラス名」を指定する
class Plan
  def self.format_date(date)
    "現在日付：#{date}"
  end
end

module Lover
  class Plan
    def self.format_schedule(schedules)
      # トップレベルのPlanクラスのformat_dateを呼び出したいが、LoverモジュールのDateクラスが
      # 呼び出されてしまうためエラーになる
      # Plan.format_date("2019/4/13") #=> undefined method `format_date' for Lover::Date:Class (NoMethodError)

      # トップレベルのクラスを呼び出したい場合は、クラス名の先頭に「::」を付ける
      "#{::Plan.format_date("2019/4/13")} #{schedules.join("、")}"
    end
  end
end

puts Lover::Plan.format_schedule(["Movie", "Restaurant"]) #=> 現在日付：2019/4/13 Movie、Restaurant
