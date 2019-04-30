#encoding: utf-8
# ===
# === 9.6.9 独自例外クラスを定義する

# StandardErrorクラスを継承して独自の例外を定義する
class NoAnimalError < StandardError
  attr_reader :animal

  # 標準の例外クラスと同様にメッセージを出力したい場合は、messageプロパティを設定する。
  # 以下の場合は、messageに加えて独自のanimalプロパティを定義している。
  def initialize(message, animal)
    @animal = animal
    # スーパークラスであるStandardErrorクラスのinitializeメソッドは、messageメソッドと連動している
    super("#{message}, #{animal}")
  end
end

def get_walking_from_animal(animal)
  case animal
  when :dog
    "Quadrupedal"
  when :cat
    "Quadrupedal"
  when :monkey
    "Bipedal"
  else
    # 独自に定義した例外を発生させる
    raise NoAnimalError.new("無効な動物名です。", animal)
  end
end

p get_walking_from_animal(:dog) #=> "Quadrupedal"

p get_walking_from_animal(:monkey) #=> "Bipedal"

p get_walking_from_animal(:wolf) #=> `get_walking_from_animal': 無効な動物名です。, wolf (NoAnimalError)
