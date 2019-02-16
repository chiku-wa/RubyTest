# encoding: utf-8

require "minitest/autorun"
require_relative "../lib/rgb.rb"

class RgbTest < MiniTest::Test
  # 16進数に変換するメソッドのテスト
  def test_to_hex
    assert_equal "#000000", to_hex(0, 0, 0)
    assert_equal "#ffffff", to_hex(255, 255, 255)
    assert_equal "#0c2238", to_hex(12, 34, 56)
  end

  # 10進数に変換するメソッドのテスト
  def test_to_ints
    assert_equal [0, 0, 0], to_ints("#000000")
    assert_equal [255, 255, 255], to_ints("#ffffff")
    assert_equal [12, 34, 56], to_ints("#0c2238")
  end

  def test_to_ints_refactoring
    assert_equal [0, 0, 0], to_ints_refactoring("#000000")
    assert_equal [255, 255, 255], to_ints_refactoring("#ffffff")
    assert_equal [12, 34, 56], to_ints_refactoring("#0c2238")
  end
end
