# encoding: utf-8
# ===
# === 8.4 例題：deep_freezeメソッドの作成

module DeepFreezable
  def deep_freeze(array_or_hash)

    # caseを用いて引数のクラスを判定し、処理を振り分ける
    case array_or_hash
    when Array
      array_or_hash.each { |ah| ah.freeze }

      # ↓わざわざこうしなくても、eachを使えばダイレクトに値を書き換えることができる
      # freeze_array_or_hash = array_or_hash.map { |ah| ah.freeze }

    when Hash
      array_or_hash.each do |key, val|
        key.freeze
        val.freeze
      end
    end
    array_or_hash.freeze
  end
end
