# encoding: utf-8
# ===
# === 8.3.1 モジュールをクラスにincludeする

# ---
# --- モジュールを用いない場合のサンプロコード
# titileメソッドが呼び出されたことをログに記録する
class Product
  def title
    log "title is called"
    "A funny movie!"
  end

  private

  # 本来はLoggerクラスを使ってログを記録するべきだが、サンプルなのでputsで出力する
  def log(text)
    puts "[LOG]#{text}"
  end
end

class User
  def name
    log "name is called"
    "James"
  end

  private

  def log(text)
    puts "[LOG]#{text}"
  end
end

product = Product.new
puts product.title
#=> [LOG]title is called
# A funny movie!

user = User.new
puts user.name
#=> [LOG]name is called
# James

# ★この実装では、同一のlogメソッドを各クラスで重複して持つことになってしまう(DRY原則に反する)
# だからといって、ProductクラスをUserクラスに継承するのはis-a関係にならないためNG
# →"ユーザは製品の一部である"ではない！
# よって、モジュールの仕組みを用いて改善する。

# ---
# --- モジュールを使って改善する
# ログ出力するモジュールを定義する
module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

class ProductLoggable
  # モジュールをincludeする
  include Loggable

  def title
    log "title is called"
    "Pacific Rim is great movie!"
  end
end

class UserLoggable
  # モジュールをincludeする
  include Loggable

  def name
    log "name is called"
    "Watson"
  end
end

product_loggable = ProductLoggable.new
puts product_loggable.title
#=> [LOG]title is called
# Pacific Rim is great movie!

user_loggable = UserLoggable.new
puts user_loggable.name
#=> [LOG]name is called
# Watson

# モジュールのデフォルトはpublicであるため、そのままだとクラスの外から呼び出せてしまう
product_loggable.log "Out of class"
#=> [LOG]Out of class

module LoggablePrivate
  # logメソッドをprivateにすることで、クラスの外部から呼び出すことはできなくなる
  private

  def log(text)
    puts "[LOG]#{text}"
  end
end

class ProductLoggablePrivate
  # モジュールをincludeする
  include LoggablePrivate

  def title
    log "title is called"
    "Private movie"
  end
end

product_loggable_private = ProductLoggablePrivate.new
puts product_loggable_private.title
#=> [LOG]title is called
# Private movie

# クラスの外からは呼び出せない
# product_loggable_private.log "Out of class"
#=> private method `log' called for #<ProductLoggablePrivate:0x00007f849404cfc0> (NoMethodError)
