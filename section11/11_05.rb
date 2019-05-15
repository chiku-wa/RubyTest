#encoding: utf-8
# ===
# === 11.5. ライブラリのコードを読む

# 標準ライブラリのsource_locationの戻り値はnil
p "RubyTest".method(:upcase).source_location #=> nil

# Dateクラスも同様
require "date"
p Date.method(:valid_date?).source_location #=> nil

