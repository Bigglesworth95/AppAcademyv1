require_relative 'player'
require_relative 'deck'
require 'byebug'
class Poker
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @deck = Deck.new
  end

  def deal
    @deck.shuffle
    players = [@player1, @player2]
    players.each do |player|
      5.times do
        player.hand.hand << @deck.deal_1
      end
    end
  end

  def play
    #debugger
    deal
    @player1.trade_cards?
    p "your hand is now #{@player1.hand.render}"
    p 'getting cards'
    until @player1.hand.hand.length == 5
      @player1.hand.hand << @deck.deal_1
    end
    @player1.hand.render
    @player1.hand.determine_score
    p ""
    p "Player2, your turn"
    @player2.trade_cards?
    p 'getting cards'
    until @player2.hand.hand.length == 5
      @player2.hand.hand << @deck.deal_1
    end
    @player2.hand.determine_score
    @player2.hand.render
    p ""
    p "The winner is #{winner}"
  end

  def winner
    p1 = @player1.hand.score
    p2 = @player2.hand.score
    debugger
    (0..p1.length).each do |i|
      result = p1[i] <=> p2[i]
      return 'player1' if result == 1
      return 'player2' if result == -1
    end
    return 'tie'
  end

end

p = Poker.new
p.play
