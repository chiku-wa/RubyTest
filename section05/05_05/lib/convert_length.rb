# encoding: utf-8
# ================================
# 例題：長さの単位変換プログラムを作成する
# ================================
UNITS = {m: 1, in: 39.37, ft: 3.28}

def convert_length(length, from:, to:)
  # length : from = X : to
  # => (length * to)/from
  # かつ、小数点第二位は切り捨て
  ((length * UNITS[to]) / UNITS[from]).round(2)
end
