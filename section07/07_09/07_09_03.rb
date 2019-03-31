#encoding: utf-8
# ===
# === 7.9.3 グローバル変数と組み込み変数
# グローバル変数はクラスの外部に定義する
$program_name = "Answer program"

class Program
  def initialize(name)
    # グローバル変数を書き換える
    $program_name = name
  end

  # クラスメソッド
  def self.name
    $program_name
  end

  # インスタンスメソッド
  def name
    $program_name
  end
end

# 最初に定義したグローバル変数値が出力される
puts Program.name #=> Answer program

# initializeメソッドで値が書き換わる
program = Program.new("Question program")
puts program.name #=> Question program

# インスタンスメソッドでグローバル変数が書き換わっているため、クラスメソッドから呼び出しても
# 値が変更されたまま
puts Program.name #=> Question program

puts $program_name #=> Question program
