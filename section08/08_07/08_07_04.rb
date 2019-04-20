# encoding: utf-8
# ===
# === 8.7.4 モジュール関数や定数を持つモジュールの例

# Mathの特異メソッド「sqrt」メソッドで平方根を求める
# ちなみに、平方根は英語で「Square root」
p Math.sqrt(4) #=> 2.0
p Math.sqrt(3) #=> 1.7320508075688772

# Mathモジュールには定数も定義されている
# 自然対数の底(てい)
p Math::E #=> 2.718281828459045
# 円周率
p Math::PI #=> 3.141592653589793

# Mathモジュールをミックスインする
class Caluculator
  include Math

  def calc_sqrt(num)
    sqrt(num)
  end
end

caluculator = Caluculator.new
puts caluculator.calc_sqrt(4) #=> 2.0

# Kernelモジュールも同様に、特異メソッドとして使え、ミックスイン可能

# 前の章でも学習したとおり、pメソッドやputsメソッドが使用できるのはObjectクラスがKernelモジュールをincludeしているから
# ※トップレベルは、Objectクラスのmainオブジェクトであるため、必然的にKernelモジュールが使用可能になる
puts "Kernel test"

# putsメソッドは特異メソッドとして呼び出すこともできる
Kernel.puts "puts method is sungular method"
