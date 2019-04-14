#encoding: utf-8
# ===
# === 8.8 状態を保持するモジュールの作成
# === Column2 モジュールの用途は1つとは限らない

# 用途①：設定値を持つために、シングルトンとして利用
module AwesomeApi
  @base_url = ""
  @debug_mode = false

  class << self
    attr_accessor :base_url, debug_mode
  end
end

# 用途②：名前空間として利用する
module AwesomeApi
  class Engine
    # 諸々の処理
  end
end
