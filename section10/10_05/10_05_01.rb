#encoding: utf-8
# =====
# ===== 10.5.1 Procオブジェクトを実行する様々な方法

proc_calc = Proc.new { |lhs, rhs| lhs + rhs }

puts proc_calc.call(10, 20) #=> 30

# callメソッド以外にもProcの処理を呼び出すことができる
#    「yield」
puts proc_calc.call(100, 200) #=> 300

# ===== 「.()」
puts proc_calc.(7, 13) #=> 20

# ===== 「[]」
puts proc_calc[100, 120] #=> 220

# ===== 「=== []」
puts proc_calc === [420, 180] #=> 600
# 以下も同じ意味
puts proc_calc.===(420, 180) #=> 600
puts proc_calc.===([420, 180]) #=> 600

# --- 「===[]」でブロックを呼び出せるのは、case文のwhen節で判定できるようにするため
def return_adult_or_child(age)
  # 判定用のProcオブジェクトを生成する
  adult = ->(n) { n >= 20 }
  child = ->(n) { n < 20 }

  case age
  # 内部的には「adult.===(age)」、つまり「adult === age」と処理されている
  when adult
    "大人"
    # 内部的には「child.===(age)」、つまり「child === age」と処理されている
  when child
    "子供"
  end
end

puts return_adult_or_child(19) #=> 子供
puts return_adult_or_child(20) #=> 大人
