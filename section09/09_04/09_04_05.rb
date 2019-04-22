# encoding: utf-8
# ===
# === 9.4.5 予期しない条件は異常終了させる

# 条件分岐だけで処理しようとする不具合の原因になる場合もある

# ---
# --- 予期せぬnilが返ることでその後の処理でエラーが発生する例
# 引数の国名をもとに、その国の通貨を返すメソッド
def return_currency(country)
  case country
  when :japan
    "yen"
  when :india
    "rupee"
  when :us
    "dollar"
  end
end

c = return_currency(:japan)
puts c.upcase #=> YEN

c = return_currency(:china)

# case句にない国が指定された場合はnilが返る仕様になっているため、upcaseメソッドがエラーになる
# puts c.upcase #=> undefined method `upcase' for nil:NilClass (NoMethodError)

# ---
# --- 改善：メソッド内であえてraiseで例外を発生させる
undef return_currency

# あえて例外を発生させることで、バグの発見を早める
def return_currency(country)
  case country
  when :japan
    "yen"
  when :india
    "rupee"
  when :us
    "dollar"
  else
    # いずれの条件にも一致しない場合は、引数が不正な旨の例外を発生させる
    raise ArgumentError, "引数が無効です"
  end
end

c = return_currency(:japan)
puts c.upcase #=> YEN

# case句にない国が指定された場合はraiseで例外が発生する
c = return_currency(:china)
#=> `return_currency': 引数が無効です (ArgumentError)
