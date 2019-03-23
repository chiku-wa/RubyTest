# encoding: utf-8
# ================================
# 5.6 ハッシュについてもっと詳しく
# ================================
def section_05_06
  # ===
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

  # ===
  # === Column
  # 配列と同様、ハッシュにも様々な便利なメソッドが存在する
  # 以下のAPIドキュメントをチェックすること。
  # なお、ハッシュにも、Hashクラス自身と、Enumerableモジュールに定義されているメソッドの二種類がある。
  # Hashに関するメソッドを知りたい場合は”両方”のドキュメントに目を通すこと。
  # https://docs.ruby-lang.org/ja/latest/class/Hash.html
  # https://docs.ruby-lang.org/ja/latest/class/Enumerable.html

  # ===
  # === 5.6.2 **でハッシュを展開させる
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

# ===
# === 5.6.3 ハッシュを使った疑似キーワード引数
# 前述で紹介したキーワード引数はRuby2.0から導入された機能であり、それ以前はメソッドの引数に
# ハッシュ値を渡して擬似的にキーワード引数として見せていた。
# 2.0以降は余り使われない。
# ★古いバージョンのRubyではこういった実装も目にするので、覚えておくと良い

# 5.4で作成したメソッドを疑似キーワード引数とした場合の例
def burger_pseudo(menu, options = {})
  # 値を取り出す必要があるため、コードが増える
  # また、単なるハッシュのためどんなキーワードを渡してもエラーにならない
  # →エラーにしたい場合は、別途ロジックの実装が必要
  potato = options[:potato]
  drink = options[:drink]

  p menu
  p "potato" if potato
  p "drink" if drink
end

burger_pseudo("teriyaki", {potato: true, drink: false})

# [参考]5.4で出てきた、キーワード引数を使った場合の実装方法
def buy_burger_keyword(menu, potato:, drink:)
  p menu
  p "potato" if potato
  p "drink" if drink
end

buy_burger_keyword("chicken", potato: false, drink: true)

# ===
# === 5.6.4 任意のキーワードを受け付ける**引数
# **引数名とすることで、任意のキーワードを受け取ることができる

# **を用いない場合
def buy_burger_keyword_not_asterisk(menu, potato: true, drink: true)
  # something
end

# キーワードにない引数を指定した場合
# buy_burger_keyword_not_asterisk("beef", potato: true, drink: false, salad: true)
#=> unknown keyword: salad (ArgumentError)

# **を用いて、任意のキーワードを指定できるようにした場合
def buy_burger_keyword_asterisk(menu, potato: true, drink: false, **others)
  #something
end

# キーワードで明示していない、salad,shakeを指定してもエラーにならない
buy_burger_keyword_asterisk("pork", potato: true, drink: false, salad: true, shake: false)

# ===
# === 5.6.5 メソッド呼び出し時の{}省略
# メソッドの"最後"の引数がハッシュの場合は、"呼び指すとき"は{}を省略できる

# 先程のメソッドを、最後の引数がハッシュのものに書き換える
def buy_burger_hash(menu, options = {})
  p options
end

# --- 省略しない場合
buy_burger_hash("fish", {"potato" => true, "drink" => false})

# --- {}省略
buy_burger_hash("mos", "potato" => false, "drink" => true)
# 末尾の引数がハッシュでない場合はエラーになる
# buy_burger_hash("potato" => false, "drink" => true, "mos")
#=>
# syntax error, unexpected ')', expecting =>
# ... false, "drink" => true, "mos")

# ===
# === 5.6.6 ハッシュリテラルの{}と、ブロックの{}
def greeting(str)
  p str
end

# メソッド呼び出し時は()を省略できる
greeting("Hello!") #=> Hello!
greeting "Hello!" #=> Hello!

def buy_burger_block_test(options = {}, menu)
  # something
end

buy_burger_block_test({potato: true, drink: false}, "beef")

# 第一引数がハッシュの場合は、呼び出し時に()を省略すると、{}がブロックとして認識されてしまうためエラーとなる
# buy_burger_block_test {potato: true, drink: false}, "beef"
#=>
# syntax error, unexpected ':', expecting '}'
# buy_burger_block_test {potato: true, drink: false}, "beef"
#                              ^

# 第二引数以降であれば省略可能
buy_burger_block_test "fish", {"potato" => true, "drink" => false}

# 前述のとおり、末尾引数がハッシュの場合は{}も省略できる
buy_burger_block_test "fish", "potato" => true, "drink" => false

# ===
# === 5.6.7 ハッシュから配列へ、配列からハッシュへ
def section_05_06_07
  # --- ハッシュ→配列の変換はto_aメソッドを使う
  currencies = {japan: "yen", us: "dollar", india: "rupee"}
  # 2次元配列に変換される
  p currencies.to_a #=> [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]

  # --- 配列→ハッシュの変換はto_hメソッドを使う
  # 上記の裏返しで、2次元配列をハッシュに変換する
  currencies_arr = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
  p currencies_arr.to_h #=> {:japan=>"yen", :us=>"dollar", :india=>"rupee"}

  # 1次元配列のように、ハッシュとして変換できないものはエラーになる
  fruits = ["apple", "banana"]
  # p fruits.to_h #=> `to_h': wrong element type String at 0 (expected array) (TypeError)

  # キーがかぶった場合は、最後の要素のみが採用されて変換される
  currencies_arr_japan = [["japan", "yen"], ["japan", "円"]]
  p currencies_arr_japan.to_h #=> {japan => "円"}

  # --- to_hメソッドはRuby2.1から登場したメソッドであり、それ以前はHash[]を使って変換していた
  currencies_arr = [[:japan, "yen"], [:us, "dollar"]]

  p Hash[currencies_arr] #=> {:japan=>"yen", :us=>"dollar"}

  # キーと値が交互に並んでいる場合は、splat展開(*)でも変換可能
  currencies_arr_alternating = [:japan, "yen", :us, "dollar", :india, "rupee"]
  p Hash[*currencies_arr_alternating] #=>{:japan => "yen", :us => "dollar", :india => "rupee"}
end

section_05_06_07

# ===
# === 5.6.8 ハッシュの初期値を理解する
def section_05_06_08
  # 前述の通り、ハッシュに存在しないキーを指定するとnilが返る
  h = {}
  p h[:foo] #=> nil

  # --- Hash.new
  # 存在しないキーが指定されたときに初期値を返したい場合は、Hash.newメソッドを使って配列を作成する
  h = Hash.new("Hello!")
  p h[:foo] #=> Hello!
  p h[:bar] #=> Hello!

  # ただし、同じ参照を持つため、破壊的メソッドなどを用いるとすべて書き換わる
  a = h[:foo]
  b = h[:bar]
  p a.equal?(b) #=> true ※同一オブジェクト(同じ参照を持つ)

  a.upcase!
  p a #=> HELLO!
  p b #=> HELLO!

  # なお、ハッシュに要素が追加されているわけではなく空のままである
  p h

  # これを防ぐには、ブロックを使って、キーが存在しない場合にその都度実行され、ブロックの戻り値として返すようにする
  h_block = Hash.new { "Hello!" }
  a = h_block[:foo]
  b = h_block[:bar]
  p a.equal?(b) #=> false

  a.upcase!
  p a #=> HELLO!
  p b #=> Hello!

  # 先ほどと同様、ハッシュ葉空のまま
  p h_block

  # --- 初期値を返すと同時に、ハッシュ自身も更新する
  # ★よく使われる★
  # 先ほどのブロックを使った例ではブロック引数を省略したが、ブロック引数を使う場合は以下が渡される。
  # 第一引数：ハッシュ自身
  # 第二引数：キー

  # 初期値を返すだけでなく、指定されたキーでハッシュも作成する
  h_generate = Hash.new { |hash, key| hash[key] = "Hello!" }
  h_generate[:foo]
  h_generate[:bar]

  p h_generate #=> {:foo => "Hello!", bar => "Hello!"}
end

section_05_06_08
