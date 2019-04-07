# encoding: utf-8
# ===
# === 8.5.1 includeされたモジュールの有無を確認する

module Loggable
end

class Product
  include Loggable
end

# --- クラスメソッドとして呼び出す
# include?メソッドで引数に渡したモジュールが存在することを確認する
p Product.include?(Loggable) #=> true

# included_modulesメソッドでincludeしたモジュールの一覧を表示する
p Product.included_modules #=> [Loggable, Kernel]

# ancestorsでスーパークラスも含めて確認する
p Product.ancestors #=> [Priduct, Loggable, Object, Kernel, BasicObject]

# is_a?メソッドでモジュールが含まれているか確認する
p Product.is_a?(Loggable) #=> true
p Product.is_a?(Object) #=> true
p Product.is_a?(BasicObject) #=> true

# --- インスタンスメソッドとして呼び出す
# 一旦classメソッドを呼び出してから各メソッドで確認する
product = Product.new

# include?メソッドで引数に渡したモジュールが存在することを確認する
p product.class.include?(Loggable) #=> true

# included_modulesメソッドでincludeしたモジュールの一覧を表示する
p product.class.included_modules #=> [Loggable, Kernel]

# ancestorsでスーパークラスも含めて確認する
p product.class.ancestors #=> [Product, Loggable, Object, Kernel, BasicObject]

# is_a?メソッドでモジュールが含まれているか確認する

# is_a? のみ、classメソッドは用いない
# classメソッドを呼ぶとfalseになる
p product.class.is_a?(Loggable) #=> false
p product.is_a?(Loggable) #=> true
