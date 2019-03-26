#encoding: utf-8
# ===
# === olumn protectedメソッド
class Parent
  def initialize
    @first = 1
    @second = 2
    @third = 3
  end

  def numnber
    "#{@first},#{@second},#{@third}"
  end
end

class Child < Parent
  def initialize
    super
    @second = 22
  end
end

child = Child.new

# Parent のsecondは「2」だが、Childで「22」に上書きされてしまっているため想定通りの出力とならない
puts child.numnber #=> 1,22,3
