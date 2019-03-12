# encoding: utf-8
# ================================
# 例題：長さの単位変換プログラムを作成する
# ================================
require "minitest/autorun"
require_relative "../lib/convert_hash_syntax.rb"

class ConvertHashSyntaxTest < Minitest::Test
  def test_convert_hash_syntax
    # ヒアドキュメント、<<~で先頭の空白が無視される
    old_syntax = <<~TEXT
      {
        :name => "Alice",
        :age =>20,
        :gender => "female"
      }
    TEXT
    expected = <<~TEXT
      {
        name: "Alice",
        age: 20,
        gender: "female"
      }
    TEXT
    assert_equal expected, convert_hash_syntax(old_syntax)
  end
end
