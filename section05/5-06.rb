# encoding: utf-8
# ================================
# 5.6 ハッシュについてもっと詳しく
# ================================
def section_05_06
  # === 5.6.1 ハッシュで使用頻度の高いメソッド
  # * keys
  # * values
  # * has_key?/key?/include?/member?

  fruits_color = {banana: "yellow", apple: "red", berry: "purple"}

  # keysメソッドは、ハッシュのキーのみを配列として返す
  p fruits_color.keys #=> [:banana, :apple, :berry]

  # valuesメソッドは、ハッシュのキーのみを配列として返す
  p fruits_color.values #=> ["yellow", "red", "purple"]

  # has_key?は、引数のキーが存在するかをtrue,falseを返す
  # ※key?/include?/member?は、has_key?のエイリアスメソッド
  p fruits_color.has_key?(:banana) #=> true
  p fruits_color.has_key?(:melon) #=> false

  # エイリアスメソッド
  p fruits_color.include?(:banana) #=> true
  p fruits_color.key?(:banana) #=> true
  p fruits_color.member?(:banana) #=> true

  # === Column
  # 配列と同様、ハッシュにも様々な便利なメソッドが存在する
  # 以下のAPIドキュメントをチェックすること。
  # なお、ハッシュにも、Hashクラス自身と、Enumerableモジュールに定義されているメソッドの二種類がある。
  # Hashに関するメソッドを知りたい場合は”両方”のドキュメントに目を通すこと。
  # https://docs.ruby-lang.org/ja/latest/class/Hash.html
  # https://docs.ruby-lang.org/ja/latest/class/Enumerable.html

  # 5.6.2 **でハッシュを展開させる
  # ハッシュ変数の前に「**」を付与すると、ハッシュの中身を展開できる
  h = {us: "dollar", india: "rupee"}
  h_deploy = {japan: "yen", **h}
  p h_deploy #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

  # 「**」をつけない(ハッシュ変数をそのまま格納する)とエラーになる
  h = {us: "dollar", india: "rupee"}
  # h_deploy = {japan: "yen", h}
  #=>
  # syntax error, unexpected '}', expecting =>
  # h_deploy = {japan: "yen", h}

end

section_05_06
