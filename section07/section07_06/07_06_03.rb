#encoding: utf-8
# ===
# === 7.6.3 オブジェクトのクラスを確認する
class User
end

# クラスを確認するいはclassメソッドを用いる
user = User.new
p user.class #=> User

# instanceof?を使って確認することもできる
# その場合は引数に、比較したいクラスを渡す
# ・userはUserクラスか？
p user.instance_of?(User) #=> true
# ・userはStringクラスか？
p user.instance_of?(String) #=> false

# 継承関係にあるかどうかはis_a?メソッドを用いる
# なお、クラスが同一でもtrueが返る(instance_of?がTrueになる条件)
# ・userはUserクラスを継承しているか？
p user.is_a?(User) #=> true
# ・userはObjectクラスを継承しているか？
p user.is_a?(Object) #=> true
# ・userはOBasicbjectクラスを継承しているか？
p user.is_a?(BasicObject) #=> true
# ・userはStringクラスを継承しているか？
p user.is_a?(String) #=> false
