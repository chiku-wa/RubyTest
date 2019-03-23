# encoding: utf-8

require "minitest/autorun"
require_relative "../lib/gate.rb"
require_relative "../lib/ticket.rb"

class GateTest < MiniTest::Test
  def test_gate
    # 梅田で券を発行して入場する
    umeda = Gate.new(:umeda)
    ticket = Ticket.new(150)
    umeda.enter(ticket)

    # 発行したチケットで十三で出場する
    juso = Gate.new(:juso)
    assert juso.exit(ticket)
  end

  def test_gate_umeda_to_mikuni_when_fare_is_not_enough
    # 梅田で券を発行して入場する
    umeda = Gate.new(:umeda)
    ticket = Ticket.new(150)
    umeda.enter(ticket)

    # 発行したチケットで三国で出場する
    mikuni = Gate.new(:mikuni)
    refute mikuni.exit(ticket) # refute → 結果がfalseであればテストをパスする
  end
end
