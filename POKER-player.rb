require_relative 'hand'
class Player
  attr_accessor :hand
  def initialize
    @hand = Hand.new
  end

  def trade_cards?
    @hand.render
    p 'how many cards do you wish to trade'
    trades = gets.chomp.to_i
    trades.times do
      p 'which card do you wish to discard?'
      card = gets.chomp.to_i
      @hand.trade(card)
      @hand.render
    end
  end


end
