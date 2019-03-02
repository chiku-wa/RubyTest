# ===
# === Column よく使われるイディオム（１）
# === 1.条件分岐で変数に代入
# === 2.&.演算子(Safe Navigation Operator)

# --- 1.条件分岐で変数に代入
# Ruby熟練者になるほど、簡素な記述を使うようになる。ここでは、条件分岐や真偽値の判定で使われる
# イディオム(定番の書き方)を紹介する。

# [簡素にしない場合]
# 通過を返す関数
def find_country(country)
  currencies = {japan: "yen", us: "dollar", india: "rupee"}
  currencies[country]
end

# 通過を大文字にして返す関数
def show_currency(country)
  currency = find_country(country)
  if currency
    currency.upcase
  end
end

p show_currency(:japan) #=> YEN
p show_currency(:china) #=> nil

# [記述を簡素にした場合]
def show_currency_simple(country)
  # Rubyでは変数の代入そのものが戻り値を返すため、以下のように記述できる
  # ただし、この書き方は「==」の誤記と心配させてしまう可能性もあるため注意
  if currency = find_country(country)
    currency.upcase
  end
end

p show_currency_simple(:japan) #=> YEN
p show_currency_simple(:china) #=> nil

# ===
# === &.演算子(Safe Navigation Operator)
# Ruby2.3から、nilの可能性があるオブジェクトに対して安全にメソッドを呼び出すことができる
# 「&.」演算子が追加された。
# オブジェクトがnilだった場合は「NoMethodError」を回避し、nilを返してくれる。
def safe_navigation_operator
  a = "apple"
  p a&.upcase #=> APPLE

  b = nil
  # p b.upcase #=> NoMethodError
  p b&.upcase #=> nil
end

safe_navigation_operator

# ちなみに、「&.」演算子は膝を抱えている人物に見えることから、別名
# 「ぼっち演算子(lonely operator)」とも呼ばれる。
# https://www.ruby-lang.org/ja/news/2015/12/25/ruby-2-3-0-released/

# ===
# === Column よく使われるイディオム（2）
# === 「||=」を使った自己代入
# ★熟練者の間では非常によく使われる
def self_assingnment_test
  # 「||=」を使うと、左辺の変数がfalseもしくはnilの場合のみ値を代入する
  # ※それ以外の場合は代入せずそのまま

  limit = 0
  limit ||= 10
  p limit #=> 0

  limit = nil
  limit ||= 10
  p limit #=> 10

  # この演算子は以下の通り分解するとわかりやすい
  limit = limit || 10
  p limit #=> 10

  # Rubyでは、式全体の評価が確定した時点で評価を終了する。そのため、Orの場合はTrue(もしくは
  # nil以外の値)を検知した時点で評価を終了する。

end

self_assingnment_test

# ===
# === Column よく使われるイディオム（3）
# === 「!!」をつかった真偽値の型変換

# 「!!」演算子を用いると、必ずtrue,falseのどちらかが返る

# [!!を用いない方法]
# ユーザが存在するかを判定する架空のメソッド
def user_exists?
  # DBなどの検索処理
  user = find_user

  # nilもしくはfalseの場合はfalseを返す
  if user
    true
  else
    false
  end
end

# [!!を使用]
def user_exists_exclamation?
  !!find_user
end

# [仕組み]
# 「!」は否定を表す演算子であり、「!A」と書けば
# * Aが真(trueもしくは値あり)ならfalse
# * Aが偽(falseもしくはnil)ならtrue
# 「!!」と記すと、二回反転するためtrue,falseを返す

def exclamation_test
  p !!true #=> true
  p !!false #=> false
  p !!123 #=> true
  p !!nil #=> false
  p !!"apple" #=> true
end

exclamation_test

# ★「!!」が出てきたら「trueもしくはfalseに変換するためのもの」とおぼえておくこと
