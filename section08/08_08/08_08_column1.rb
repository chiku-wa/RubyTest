#encoding: utf-8
# ===
# === 8.8 状態を保持するモジュールの作成
# === Column1 Singletonモジュールを使う

# singletonライブラリをrequireする必要がある
require "singleton"

class Configuration
  # Singletonモジュールをincludeする
  include Singleton

  attr_accessor :base_url, :debug_mode

  # 引数なしのinitializeメソッドを定義する
  def initialize
    @base_url = base_url
    @debug_mode = debug_mode
  end
end

# Singletonモジュールをincludeしているためnewメソッドを呼び出せない
# configuration = Configuration.new #=> private method `new' called for Configuration:Class (NoMethodError)

# instanceメソッドでインスタンスを生成できる
configuration = Configuration.instance

# 値をセットする
configuration.base_url = "http://example.com"
configuration.debug_mode = true

puts configuration.base_url #=> http://example.com
puts configuration.debug_mode #=> true

# 別の変数にセットしても同じ値が返ってくる
other_configuration = Configuration.instance
puts other_configuration.base_url #=> http://example.com
puts other_configuration.debug_mode #=> true

# どちらも同じオブジェクトIDを持っていくことがわかる
# ※equal?メソッドは、オブジェクトが等しいかどうかを判定するメソッド
puts configuration.equal?(other_configuration) #=> true
