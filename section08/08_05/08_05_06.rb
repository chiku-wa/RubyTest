# encoding: utf-8
# ===
# === 8.5.6 トップレベルはmainという名前のObject

# Objectクラス
p self.class

# Objectクラスのmainインスタンス
p self #=> main

class User
  p self #=> User
  p self.class #=> Class ※ClassクラスはObjectクラスを継承しているため、Kernelモジュールのメソッドを使用できる

  def format_name
    p self.class #=> User
    p self #=> #<User:0x00007fa2468549c8>
  end
end

User.new.format_name
