# encoding: utf-8
require "minitest/autorun"
require_relative "../lib/word_synth.rb"
require_relative "../lib/effects_module.rb"

class WordSynthTest < Minitest::Test
  include Effects

  # =====
  # === テスト
  # オブジェクトがnewできる事を確認
  def test_initalize
    word_synth = WordSynth.new
    assert word_synth
  end

  # エフェクトを追加できることを確認する
  def test_add_effect
    word_synth = WordSynth.new
    dummy_proc = -> { }
    assert_equal word_synth.add_effect(dummy_proc).size, 1
  end

  # エフェクトを付けない場合は、そのまま文字が蹴ってくることを確認する
  def test_play_non_effect
    word_synth = WordSynth.new
    assert_equal "Toy Story", word_synth.play("Toy Story")
  end

  # reverseエフェクトのテスト
  def test_play_reverse
    word_synth = WordSynth.new
    word_synth.add_effect(Effects.reverse)
    assert_equal "cificaP miR", word_synth.play("Pacific Rim")
  end

  # echoエフェクトのテスト
  def test_play_echo
    word_synth = WordSynth.new
    word_synth.add_effect(Effects.echo(2))
    assert_equal "TTooyy SSttoorryy", word_synth.play("Toy Story")
  end

  # loudエフェクトのテスト
  def test_play_loud
    word_synth = WordSynth.new
    word_synth.add_effect(Effects.loud(4))
    assert_equal "TOY!!!! STORY!!!!", word_synth.play("Toy Story")
  end

  # echo、loud、reverseの重ねがけテスト
  def test_play_for_echo_loud_reverse
    word_synth = WordSynth.new
    word_synth.add_effect(Effects.echo(2))
    word_synth.add_effect(Effects.loud(3))
    word_synth.add_effect(Effects.reverse)
    assert_equal "!!!YYOOTT !!!YYRROOTTSS", word_synth.play("Toy Story")
  end
end
