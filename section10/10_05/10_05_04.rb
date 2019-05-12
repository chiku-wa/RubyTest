#encoding: utf-8
# =====
# ===== 10.5.4 ややこしい2つめのProc.newとラムダの違い

numbers = [1, 2, 3, 4, 5]

# ===
# === returnの違い
# ---Proc.new
# 引数の配列の各要素を2倍にした後、すべての要素の値を足し算する
def caluclator_2x_proc(numbers)
  calc_proc = Proc.new { |n| return n * 2 }

  total = numbers
    .map(&calc_proc)
    .inject { |res, n| res + n }
  "合計値：#{total}"
end

# Proc.newはメソッドそのものが終了するため、mapの処理も中断される
p caluclator_2x_proc(numbers) #=>  2

# ---ラムダ演算子
def caluclator_2x_lambda(numbers)
  # returnを記載しない場合と同じ意味になる
  calc_proc = ->(n) { return n * 2 }

  total = numbers
    .map(&calc_proc)
    .inject { |res, n| res + n }
  "合計値：#{total}"
end

# ラムダだと、ブロックの処理は終了するが、mapメソッドは継続して実行される
p caluclator_2x_lambda(numbers) #=>  合計値：30

# ===
# === breakの違い
# ---Proc.new
# 引数の配列の各要素を3倍にした後、すべての要素の値を足し算する
def caluclator_3x_proc(numbers)
  calc_proc = Proc.new { |n| break n * 2 }

  total = numbers
    .map(&calc_proc)
    .inject { |res, n| res + n }
  "合計値：#{total}"
end

# 例外が発生する
# p caluclator_3x_proc(numbers) #=> break from proc-closure (LocalJumpError)

# --- ラムダ演算子
def caluclator_3x_lambda(numbers)
  calc_proc = ->(n) { break n * 2 }

  total = numbers
    .map(&calc_proc)
    .inject { |res, n| res + n }
  "合計値：#{total}"
end

p caluclator_3x_lambda(numbers) #=>  合計値：30
