#encoding: utf-8
# ===
# === 7.5.2 クラスメソッドやクラス構文直下のself
# selfは、定義する場所によって意味合いが異なってくる
#
class Foo
  # ①クラス直下
  p "クラス直下: #{self}"

  # ②クラスメソッド直下
  def self.bar
    p "クラスメソッド直下: #{self}"
  end

  # ③インスタンスメソッド直下
  def baz
    p "インスタンスメソッド直下: #{self}"
  end
end

# インスタンスメソッドの場合だけ出力が異なる
# ①クラス直下
# →クラスそのものを指す
foo = Foo.new #=> Foo

# ②クラスメソッド直下
# →①と同様、クラスそのものを指す
Foo.bar #=> Foo

# ③インスタンスメソッド直下
# →①②とは異なり、Fooクラスの"インスタンス"を指す
foo.baz #=> #<Foo:0x00007ff09482ce68>"

# === エラーになるパターン ===
# ①クラスメソッドからインスタンスメソッドを呼び出す
# ②インスタンスメソッドからクラスメソッドを呼び出す
#
# === エラーにならないパターン ===
# ③クラス直下でクラスメソッドを呼び出す
#   ※ただし、クラスメソッドを定義したあとでないとエラーになる
class FooErr
  # ③クラスメソッドを定義する前にクラスメソッドを呼び出そうとするとエラーになる
  # self.bar #=>  `<class:FooErr>': undefined method `bar' for FooErr:Class (NoMethodError)

  # ①クラスメソッドからインスタンスメソッドを呼び出す
  def self.bar
    # selfをつけなかった場合も同様の挙動になる
    self.baz
  end

  # ③クラス直下でクラスメソッドを呼び出す(クラスメソッド定義後)
  self.bar

  # ②インスタンスメソッドからクラスメソッドを呼び出す
  def baz
    # selfをつけなかった場合も同様の挙動になる
    self.bar
  end
end

FooErr.bar #=> undefined method `baz' for Foo_err:Class (NoMethodError)

foo_err = FooErr.new
foo_err.baz #=> undefined method `bar' for #<FooErr:0x00007fc39700fbb0> (NoMethodError)
