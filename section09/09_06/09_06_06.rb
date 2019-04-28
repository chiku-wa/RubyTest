#encoding: utf-8
# ===
# === 9.6.6 $!と$@に格納される例外情報
def embedded_variable
  begin
    "Tom".no_exists_method
  rescue
    # 組み込み変数$!で、例外クラスを取得できる
    puts "例外クラス：#{$!.class}"
    puts "例外メッセージ：#{$!.message}"
    # 組み込み変数$@でバックトレースを取得できる
    puts "バックトレース：#{$@}"
  end
end

embedded_variable
#=>
# 例外クラス：NoMethodError
# 例外メッセージ：undefined method `no_exists_method' for "Tom":String
# バックトレース：["〜/section09/09_06/09_06_06.rb:6:in `embedded_variable'", "〜/section09/09_06/09_06_06.rb:15:in `<main>'"]
