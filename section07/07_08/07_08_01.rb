#encoding: utf-8
# ===
# === 7.8.1 定数と再代入
class Product
  DEFAULT_PRICE = 0
  # 再代入して値を書き換える
  DEFAULT_PRICE = 100

  # クラス内部でfreezeで凍結することもできるが、メソッドの定義もできなくなるためまず使われない。
  # freeze
  # def hello
  # end
  #=>  can't modify frozen class (FrozenError)
end

# エラーは出るが、再代入した値が返ってくる
puts Product::DEFAULT_PRICE #=> 100
#=>
# already initialized constant Product::DEFAULT_PRICE
# previous definition of DEFAULT_PRICE was here

# クラスの外部からも再代入可能

Product::DEFAULT_PRICE = 999
puts Product::DEFAULT_PRICE #=> 9999
#=>
# already initialized constant Product::DEFAULT_PRICE
# previous definition of DEFAULT_PRICE was here

Product::DEFAULT_NAME = "ToyStory"

# 再代入を許したくない場合はfreezeを用いる
# 再代入時にエラーが発生して処理されなくなる
Product.freeze
# Product::DEFAULT_PRICE = 777 #=>  can't modify frozen #<Class:Product> (FrozenError)
