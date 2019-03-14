#encoding: utf-8
# ===
# === 6.4 例題：Rubyのハッシュ記法を変換する
def convert_hash_syntax(old_syntax)
  old_syntax.gsub(/[:|"](\w+)["]* *=> */, '\1: ')
end
