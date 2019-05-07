# encoding: utf-8
require "minitest/autorun"
require_relative "../lib/effects_module.rb"

class EffectsTest < Minitest::Test
  include Effects

  # reverseのテスト
  def test_effect_reverse
    proc_reverse = Effects.reverse
    # 実行方法：assert_equal(期待値, テスト対象)
    assert_equal "cificaP miR", proc_reverse.call("Pacific Rim")
  end

  # echoのテスト
  def test_effect_echo
    proc_echo = Effects.echo(2)
    # 実行方法：assert_equal(期待値, テスト対象)
    assert_equal "PPaacciiffiicc RRiimm", proc_echo.call("Pacific Rim")
  end

  # loudのテスト
  def test_effect_loud
    proc_echo = Effects.loud(3)
    # 実行方法：assert_equal(期待値, テスト対象)
    assert_equal "PACIFIC!!! RIM!!!", proc_echo.call("Pacific Rim")
  end

  # echo,loud,reverseの順にテスト
  def test_echo_loud_reverse
    original_word = "Pacific Rim"
    echo_word = Effects.echo(3).call(original_word)
    echo_loud_word = Effects.loud(4).call(echo_word)
    echo_loud_reverse_word = Effects.reverse.call(echo_loud_word)
    # 実行方法：assert_equal(期待値, テスト対象)
    assert_equal "!!!!CCCIIIFFFIIICCCAAAPPP !!!!MMMIIIRRR", echo_loud_reverse_word
  end
end
