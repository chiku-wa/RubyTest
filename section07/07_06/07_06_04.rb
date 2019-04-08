#encoding: utf-8
# ===
# === 7.6.4 ほかのクラスを継承したクラスを作る
#
# 独自のクラスを定義する場合はObjectクラス以外を継承させることもできる

# Productクラスをスーパークラスとし、DVDクラスをサブクラスとして作成
class Product
end

# [書式]
# サブクラス < スーパークラス
class DVD < Product
end

dvd = DVD.new
p dvd.is_a?(DVD) #=> true
p dvd.is_a?(Product) #=> true

p DVD.superclass #=> Product
