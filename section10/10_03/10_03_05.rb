#encoding: utf-8
# ===
# === 10.3.5 Proc.newかラムダかを判断するlambda?メソッド

# Proc.newの場合はfalse
proc1 = Proc.new { |a, b| a + b }
p proc1.lambda? #=> false

proc2 = proc { |a, b| a + b }
p proc2.lambda? #=> false

# ラムダの場合はtrue
proc3 = lambda { |a, b| a + b }
p proc3.lambda? #=> true

proc4 = ->(a, b) { a + b }
p proc4.lambda? #=> true
