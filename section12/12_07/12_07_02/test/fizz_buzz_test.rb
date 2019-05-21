# encoding: utf-8

require "minitest/autorun"
require_relative "../lib/fizz_buzz"

# 以下の記述でも可能だが、テストを実行する場合はルートディレクトリに移動する必要がある「
# require "./lib/fizz_buzz"

class FizzBuzzTest < Minitest::Test
  def test_fizz_buzz
    assert_equal "1", fizz_buzz(1)
    assert_equal "2", fizz_buzz(2)
    assert_equal "Fizz", fizz_buzz(3)
    assert_equal "Buzz", fizz_buzz(5)
    assert_equal "FizzBuzz", fizz_buzz(15)
  end

  def test_fizz_buzz_arr
    test_cases = {
      1 => "1",
      2 => "2",
      3 => "Fizz",
      4 => "4",
      5 => "Buzz",
      15 => "FizzBuzz",
    }

    test_cases.each { |arg, expect|
      assert_equal expect, fizz_buzz(arg)
    }
  end
end
