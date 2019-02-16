# encoding: utf-8

def to_hex(r, g, b)
  # inject:畳み込み演算、引数の値に対して、配列の文字列を連結した結果を返す
  [r, g, b].inject("#") do |hex, n|
    hex + n.to_s(16).rjust(2, "0")
  end
end

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]

  # mapは、戻り値を配列形式に格納して返す
  [r, g, b].map { |n| n.hex }
end

def to_ints_refactoring(hex)
  # mapは、戻り値を配列形式に格納して返す
  # scanは、正規表現に一致した文字列の塊を1要素にした配列を返す
  hex.scan(/\w{2}/).map(&:hex)
end
