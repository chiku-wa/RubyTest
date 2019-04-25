#encoding: utf-8
# ===
# === #9.6.4 例外処理と戻り値

# 例外処理の戻り値は、例外発生の有無や節の構成によって異なる

# パターン①
# 例外：なし
# else節：あり
# ensure節：あり
#   →elseが返る
def non_exception_return_else
  begin
    "End of begin"
  rescue
    "End of rescue"
  else
    "End of else"
  ensure
    "End of ensure"
  end
end

# パターン②
# 例外：なし
# else節：なし
# ensure節：あり
#   →beginが返る
def non_exception_return_begin
  begin
    "End of begin"
  rescue
    "End of rescue"
  ensure
    "End of ensure"
  end
end

# パターン③
# 例外：あり
# rescue節：あり
# ensure節：あり
#   →rescueが返る
def go_exception_return_rescue
  begin
    raise "SomeException"
    "End of begin"
  rescue
    "End of rescue"
  ensure
    "End of ensure"
  end
end

# パターン④
# 例外：あり
# rescue節：なし
# ensure節：あり
#   →補足されないため、エラーが発生する
def go_exception_return_error
  begin
    raise "SomeException"
    "End of begin"
  ensure
    "End of ensure"
  end
end

puts non_exception_return_else
#=> End of else

puts non_exception_return_begin
#=> End of begin

puts go_exception_return_rescue
#=> End of rescue

# puts go_exception_return_ensure
#=> `go_exception_return_rescue': SomeException (RuntimeError)

# ===
# === Column ensure節ではreturnは使わない
# ensure節にreturnを明記すると、例外の発生の有無にかかわらずensureの値が返る

# 例外：なし
# else節：あり ※returnを明記
#   →rescue節の値は返らず、ensure節の値が返る
def non_exception_return_ensure
  begin
    "End of begin"
  rescue
    "End of rescue"
  else
    "End of else"
  ensure
    return "End of ensure"
  end
end

puts non_exception_return_ensure
#=> End of ensure

# 例外：あり
# rescue節：あり
# ensure節：あり ※returnを明記
#   →rescue節の値は返らず、ensure節の値が返る
def go_exception_return_ensure
  begin
    raise "SomethingError"
    "End of begin"
  rescue
    "End of rescue"
  ensure
    return "End of ensure"
  end
end

puts go_exception_return_ensure
#=> End of ensure

# 【重要！】
# ensure節でreturnを明記しており、かつbeginとensure節しかない場合は例外自体が発生せず、

# ---
# --- returnがない場合
def begin_and_ensure_only_without_return
  begin
    raise "SomethingError"
    "End of begin"
  ensure
    "End of ensure"
  end
end

# puts begin_and_ensure_only_without_return
#=> `begin_and_ensure_only_without_return': SomethingError (RuntimeError)

# ---
# --- returnがある場合
puts begin_and_ensure_only_with_return
#=> End of ensure
#  ※例外は返らない、本来は以下のエラーが返る

# 必ず正常終了する
def begin_and_ensure_only_with_return
  begin
    raise "SomethingError"
    "End of begin"
  ensure
    return "End of ensure"
  end
end

puts begin_and_ensure_only_with_return
#=> End of ensure
#  ※例外は返らない、本来は以下のエラーが返る
# `begin_and_ensure_only_without_return': SomethingError (RuntimeError)
