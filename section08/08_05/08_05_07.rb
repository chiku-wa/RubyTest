# encoding: utf-8
# ===
# === 8.5.7 クラスやモジュール自身もオブジェクト

# ===
# === 各オブジェクトの継承関係
# String、Arrayクラスは、Classクラスのオブジェクト(インスタンス)である
# classメソッドは、レシーバのインスタンスが属するクラスを返す
p String.class #=> Class
p Array.class #=> Class

# ClassクラスのスーパークラスはModule
p Class.superclass #=> Module

module Loggable
end

# ModuleオブジェクトはModuleクラスのインスタンスである
p Loggable.class #=> Module

# ModuleクラスのスーパークラスはObject
p Module.superclass #=> Object

# ===
# === 構文の内部のselfの扱い

# selfは呼び出された場所のクラスやモジュール自身を指す
class User
  p self  #=> User
  p self.class #=> Class
end

module Wearable
  p self #=> Wearable
  p self.class #=> Module
end
