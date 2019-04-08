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

# クラスメソッドからグローバル変数を呼び出す
puts Program.name #=> Answer program

# インスタンスメソッドからグローバル変数を呼び出す
# →値をinitializeメソッドで値を書き換える
program = Program.new("Question program")
puts program.name #=> Question program

# インスタンスメソッドでグローバル変数が書き換わっているため、クラスメソッドから呼び出しても
# 値が変更されたまま
puts Program.name #=> Question program
# グローバル変数を直接呼び出すことも可能(クラスの修飾やインスタンスの生成は不要)
puts $program_name #=> Question program
