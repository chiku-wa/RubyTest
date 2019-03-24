# encoding: utf-8
# ================================
# 例題：長さの単位変換プログラムを作成する
# ================================
require "minitest/autorun"
require_relative "./lib/convert_length.rb"

class ConvertLengthTest < MiniTest::Test
  def test_convert_length
    assert_equal 39.37, convert_length(1, from: :m, to: :in)
    assert_equal 0.38, convert_length(15, from: :in, to: :m)
  end
end
