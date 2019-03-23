# encoding: utf-8
# ================================
# 5.7 シンボルについてもっと詳しく
# ================================
def section_05_07
  # ===
  # === 5.7.1 シンボルを作成するさまざまな方法
  # シンボルで定義する文字列には、変数名やクラス名、メソッドの識別子として有効な文字を書く
  # 通常の文字列
  puts :apple
  puts :apple

  # グローバル変数
  puts :$dollar #=> @dollar

  # インスタンス変数　※詳細は7章にて
  puts :@at_mark #=> @at_mark

  # --- 以下のように変数名として無効な文字列は定義できない

  # 数字で始まる
  # :12345 #=> syntax error, unexpected tINTEGER, expecting tSTRING_CONTENT or tSTRING_DBEG or tSTRING_DVAR or tSTRING_END

  # ハイフンやスペースを含む
  # :ruby-symbol #=> NameError
  # :ruby symbol #=> SyntaxError
  # :() #=> SyntaxError

  # ただし、シングルクォート、ダブルクォートで囲むと問題なし
  puts :"12345" #=> 12345
  puts :"ruby-symbol" #=> ruby-symbol
  puts :"()" #=> ()

  # シンボルを式展開に使うこともできる
  name = "Tom"
  puts :"My name is #{name}." #=> My name is Tom.

  # --- ハッシュを作成するときに「キー: 値」の記法を使うと、キーがシンボル扱いになる
  currencies = {japan: "yen", "india" => "rupee"}
  currencies.each do |key, val|
    puts "#{key} =====> #{key.class}"
  end
  #=>
  # japan =====> Symbol
  # india =====> String

  # ===
  # ===5.7.3 %記法でシンボルやシンボルの配列を作成する
  # 「:」以外にも、「%」を使ってシンボルを作成することもできる

  # --- 文字列を使う
  # 「%s」→区切り文字は@
  puts %s@Ruby is great language@ # Ruby is great language

  # --- 配列を定義する
  # 「%i」→区切り文字は()
  # スペース区切りで要素を区切って作成する
  p %i(apple melon banana) #=> [:apple, :melon, :banana]

  # 改行文字を展開したい場合は「%I」を使う
  # 「%i」だと、展開されずそのままシンボルになる
  fruit = "pineapple"
  puts %i@melon apple\njuice #{fruit}@
  #=>
  # melon
  # apple\njuice
  # #{fruit}

  puts %I@melon apple\njuice #{fruit}@
  #=>
  # melon
  # apple
  # juice
  # pineapple

  # 文字列に例えるなら、%iはシングルクォートで囲った場合、%Iはダブルクォートで囲った場合と同じ
  # と覚えれば良い。

  # ===
  # === 5.7.3 シンボルと文字列の関係
  # 文字列とシンボルは別物なので、同列に扱うことはできない

  # 例：文字列の結合
  string = "apple"
  symbol = :apple
  p string == symbol # false
  # string + symbol #=> `+': no implicit conversion of Symbol into String (TypeError)

  # ただし、String→Symbol、Symbol→Stringへの変換メソッドを使えば可能

  # --- String→Symbolへの変換は「to_sym」
  string_to_sym = string.to_sym
  p string_to_sym == symbol #=> true
  # シンボルは+演算子で結合できないためエラーとなる
  # p (string_to_sym + symbol) #=> undefined method `+' for :apple:Symbol (NoMethodError)

  # --- Symbol→Stringへの変換は「to_s」
  symbol_to_s = symbol.to_s
  p symbol_to_s == string #=> true
  p symbol_to_s + string #=> appleapple

  # --- ただし、メソッドによっては文字列とシンボルを同列に扱う場合もある
  # respond_toメソッドは、引数で指定したメソッド名がレシーバーから呼び出せるかどうかを判定する
  # ためのメソッドだが、こちらの引数には文字列もシンボルも利用可能。
  p "apple".respond_to?("include?") #=> true
  p "apple".respond_to?(:include?) #=> true

  # respond_toメソッドについては公式リファレンスにも記されている。
  #respond_to? (Object) - Rubyリファレンス
  # https://ref.xaio.jp/ruby/classes/object/respond_to
  # >respond_to?メソッドは、レシーバのオブジェクトに対してメソッドを呼び出せるかどうかを調べます。
  # >引数nameにはメソッド名をシンボルか文字列で指定します。
  # >メソッドnameを持っていればtrue、なければfalseが返ります。

  # 反面、includeメソッドの引数には文字列しか渡せない
  # Search results: include - Rubyリファレンス
  # https://ref.xaio.jp/wikis/2/entries/search?q=include
  # 引数にシンボルを受け取ることができるメソッドはなし

  # 文字列は渡せる
  p "apple".include?("pp") #=> true

  # シンボルを渡すとエラー
  # p "apple".include?(:pp) #=> no implicit conversion of Symbol into String (TypeError)
end

section_05_07
