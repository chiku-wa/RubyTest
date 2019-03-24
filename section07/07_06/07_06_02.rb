#encoding: utf-8
# ===
# === 7.6.2 デフォルトで継承されるObjectクラス
#
# 独自に定義したクラスは暗黙的にObjectクラスが継承される
class User
end

user = User.new

# Objectクラスを継承しているためto＿sメソッドやnil?メソッドを呼び出せる
p user.to_s #=> "#<User:0x00007fb638094cf0>"
p user.nil?  #=> false

p User.superclass #=> Object

# 次のようにすると、Objectクラスから継承したメソッドの一覧を参照できる
p user.methods.sort #=> [:!, :!=, :!~, :<=>, (中略) :untrusted?, :yield_self]
