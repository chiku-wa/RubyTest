# encoding: utf-8

require "minitest/autorun"
require_relative "../lib/gate.rb"
require_relative "../lib/ticket.rb"

class GateTest < MiniTest::Test
  # setupメソッドは、各テストメソッドの前にかならず実行されるため、Gateオブジェクト生成
  # はこのメソッドにまとめてしまう
  def setup
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  def test_gate_umeda_to_juso
    # 梅田で券を発行して入場する
    ticket = Ticket.new(150)
    @umeda.enter(ticket)

    # 発行したチケットで十三で出場する
    assert @juso.exit(ticket)
  end

  def test_gate_umeda_to_mikuni_when_fare_is_not_enough
    # 梅田で券を発行して入場する
    ticket = Ticket.new(150)
    @umeda.enter(ticket)

    # 発行したチケットで三国で出場する
    refute @mikuni.exit(ticket) # refute → 結果がfalseであればテストをパスする
  end

  def test_gate_umeda_to_mikuni_when_fare_is_enough
    # 梅田で券を発行して入場する
    ticket = Ticket.new(190)
    @umeda.enter(ticket)

    # 三国で出場する
    assert @mikuni.exit(ticket)
  end

  def test_gate_juso_to_mikuni
    # 十三で券を発行して入場する
    ticket = Ticket.new(150)
    @juso.enter(ticket)

    # 三国で出場する
    assert @mikuni.exit(ticket)
  end
end
