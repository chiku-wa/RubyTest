#encoding: utf-8
# ===
# === 8.8 状態を保持するモジュールの作成

# AwesomeApiは、何らかのAPIを利用するライブラリ…という想定のモジュール
# Awesome…すごい、という意味
module AwesomeApi
  # モジュールの直下で定義しているため、クラスインスタンス変数として機能する
  # ※クラスの場合と同様の挙動
  @base_url = ""
  @debug_mode = false

  # クラスインスタンス変数のSetter,Getterを定義する
  # ※クラスインスタンス変数なので、self相当の記述が必要
  class << self
    attr_accessor :base_url, :debug_mode

    # 以下と同じ意味を持つ
    # もちろん、「class << self」を用いずに、個別にselfを定義しても同じ意味を持つ。
    # def base_url
    #   @base_url
    # end

    # def base_url=(base_url)
    #   @base_url = base_url
    # end

    # def debug_mode
    #   @debug_mode
    # end

    # def debug_mode=(debug_mode)
    #   @debug_mode = debug_mode
    # end
  end
end

p AwesomeApi.base_url #=> ""
p AwesomeApi.debug_mode #=> false

# Setterでモジュールのインスタンス変数を設定する
AwesomeApi.base_url = "http://example.com"
AwesomeApi.debug_mode = true

# Getterでモジュールのインスタンス変数を参照する
puts AwesomeApi.base_url  #=> http://example.com
puts AwesomeApi.debug_mode #=> true
