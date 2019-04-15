# frozen_string_literal: true

# ===
# === 8.9.1 メソッド探索のルールを理解する

# メソッドは、定義方法によって優先順位が異なる
# to_sメソッドを例に取る
module A
  def to_s
    # superと記すと、スーパークラスの同名メソッドを呼び出す
    # 詳細は「7.5.6 superでスーパークラスのメソッドを呼び出す」を参照
    # https://github.com/chiku-wa/RubyTest/blob/master/section07/07_06_05
    "<A> #{super}"
  end

  def print_test
    "test #{super}"
  end
end
module B
  def to_s
    "<B> #{super}"
  end

  def print_test
    "test #{super}"
  end
end

class Mammals
  def to_s
    "<Mammals>#{super}"
  end

  def print_test
    "test #{super}"
  end
end

class Human < Mammals
  include A
  include B

  def to_s
    "<Human>#{super}"
  end

  def print_test
    "test #{super}"
  end
end

human = Human.new

# 呼び出し順は以下の通りとなる
# ・そのクラス自身のto_sメソッド
# ・includeしたモジュール(2番目)のto_sメソッド
# ・includeしたモジュール(1番目)のto_sメソッド
# ・継承したスーパークラスのto_sメソッド
# ・継承したスーパークラスのMammalsのスーパークラスであるObjectクラスのto_sメソッド
p human.to_s #=> "<Human><B> <A> <Mammals>#<Human:0x00007fd2db823e70>"

# メソッドが探索された順番が知りたければ以下のメソッドを用いること
p Human.ancestors #=> [Human, B, A, Mammals, Object, Kernel, BasicObject]

# 存在しないメソッドの場合、一通り探索したのちNoMethodErrorを返す
# print_testメソッドは、Objectクラスには定義されていないため、Mammalsクラスのsuper実行時にエラーが出る
# p human.print_test #=> 08_09_01.rb:36:in `print_test': super: no superclass method `print_test' for #<Human:0x00007fa01e06fc50> (NoMethodError)
