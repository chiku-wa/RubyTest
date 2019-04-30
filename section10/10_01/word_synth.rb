#encoding: utf-8

class WordSynth
  def initialize
    # 効果の種類(リバース、エコー、ラウド)を格納する配列
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(original_words)
    # injectメソッドを用いて、複数の効果を累積し適用する
    @effects.inject(original_words) do |word, effect|
      # 効果を適用する
      effect.call(words)
    end
  end
end
