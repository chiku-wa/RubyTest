#encoding: utf-8
# =====
# ===== 10.5.3 Procオブジェクトとクロージャ

# 通常、メソッド内部の変数は実行するたびに初期化されるが、Procオブジェクトを内包している場合は、
# 状態を保持する。

# 引数の配列に、カウントアップ変数の値を格納する
def generate_array_proc(arr)
  counter = 0
  # Procインスタンス内部でメソッドのローカル変数であるcounterとarrを参照する
  Proc.new do
    counter += 1
    arr << counter
  end
end

# メソッドを実行し、Procインスタンスを受け取る
arr = []
proc = generate_array_proc(arr)
# Procインスタンスを生成しただけなので当然配列の中身は空
p arr #=> []

# メソッドの戻り値であるProcインスタンスを実行する
proc.call
proc.call

# メソッドの実行が終了しても、Procインスタンスが内包しているローカル変数counterとarrは
# 保持されるため、実行するたびに配列が増えていることがわかる。
# ※引数として渡したarrは同じ参照を持つため、Procインスタンスがarrを書き換えると
p arr #=> [1, 2]

# === 捕捉 ===
puts "---"
# Procがない場合の動きは以下の通りとなる
def generate_array(arr)
  cnt = 0
  cnt += 1
  arr << cnt
end

arr = []
generate_array(arr)
p arr #=> [1]

generate_array(arr)
generate_array(arr)

# arrは同じ参照を持つため要素は増えるが、counterはその都度初期化されるため、すべて1が格納される
p arr #=> [1, 1, 1]
