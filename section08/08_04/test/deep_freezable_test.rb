# encoding: utf-8
require "minitest/autorun"
require_relative "../lib/DVD.rb"
require_relative "../lib/Foot.rb"

# ===
# === 8.4 例題：deep_freezeメソッドの作成
class DeepFreezableTest < Minitest::Test
  def test_deep_freeze_to_array
    # ①配列の値が正しいか？
    assert_equal ["Pacific Rim", "Toy Story3", "Monsters Inc"], DVD::MOVIES

    # ②配列そのものがfreezeされているか？
    assert DVD::MOVIES.frozen?

    # ③配列の各要素がfreezeされているか？
    # all?メソッドは、ブロックの値がすべてtrueだった場合にtrueを返す
    # all? (Enumerable) - Rubyリファレンス
    # https://ref.xaio.jp/ruby/classes/enumerable/all
    assert DVD::MOVIES.all? { |movie| movie.frozen? }
  end

  def test_deep_freeze_to_array
    # ①ハッシュの値が正しいか？
    # ハッシュの場合は、assert_equalの引数を()で囲む必要がある
    assert_equal({ "cow" => 4, "human" => 2, "spider" => 8 }, Foot::ANIMALS)

    # ②ハッシュそのものがfreezeされているか？
    assert Foot::ANIMALS, frozen?

    # ③ハッシュの各キーと値がfreezeされているか？
    assert Foot::ANIMALS.all? { |key, val| key.frozen? && val.frozen? }
  end
end
