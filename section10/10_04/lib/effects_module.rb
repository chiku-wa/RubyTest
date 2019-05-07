# encoding: utf-8
module Effects
  class << self
    # 半角スペースで区切られた文字を1単語とし、単語を反転させる
    # 例；
    # Ruby is fun → nuf si ybuR
    def reverse
      ->(word) do
        # シンボルを使って簡潔に書くこともできる。
        # 詳しくは「4.4.5 &とシンボルを使ってもっと簡潔に書く」を参照
        # 1.ブロック引数が1つであること
        # 2.ブロック内で使用するメソッドには、引数がないこと(今回はreverseメソッドが相当)
        # 3.ブロックの中で、「メソッドを一度だけ呼び出す」以外の処理を記述していないこと
        word.split(" ").map(&:reverse).join(" ")
        # 以下の処理と同じ意味
        # word.split(" ").map { |text| text.reverse }.join(" ")
      end
    end

    # 指定された引数の数値分だけ文字を繰り返す(半角スペースを除く)
    # 例：
    # Ruby is fun → RRuubbyy iiss ffuunn
    def echo(num = 1)
      ->(word) do
        # スペースで区切られた単語を、さらに1文字単位で分割し、引数の数値分だけ複製する
        word.chars.map { |one_char| one_char == " " ? one_char : one_char * num }.join

        # 以下、センスのない書き方
        # echo_words = word.split(" ").map do |one_word|
        #   one_word.chars.map { |one_char| one_char * num }.join
        # end
        # echo_words.join(" ")
      end
    end

    # 文字をすべて大文字に変換し、
    # 半角スペースで区切られた文字を1単語として、引数の回数分だけ単語の末尾に「!」を付与する。
    # 例：
    # Ruby is fun → RUBY!! IS!! FUN!!
    def loud(level = 1)
      ->(word) do
        # 破壊的メソッドを用いて大文字に変換することも可能だが、word変数が他のメソッドで
        # 流用された時にバグ混入の原因になる為避ける。
        # word.upcase!

        # メソッドチェーンは改行して見やすく表現する
        word
          .split(" ")
          .map { |one_word| "#{one_word.upcase}#{"!" * level}" }
          .join(" ")
      end
    end
  end
end
