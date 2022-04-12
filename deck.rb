require_relative 'card'
require 'byebug'
class Deck
  attr_reader :deck
  SUITS = [
    'Hearts',
    'Spades',
    'Diamonds',
    'Clubs'
  ]
  def initialize
    @deck = []
    populate_deck
  end

  def populate_deck
    SUITS.each do |suit|
      (2..14).each do |value|
        @deck << Card.new(value, suit)
      end
    end
  end

  def spec
    dict = Hash.new {|h, k| h[k] = []}
    @deck.each do |card|
      suit = card.suit.to_sym
      #debugger
      value = card.value
      dict[suit] << value

    end
    #expect(dict.all? {|suit| suit.length == 14}).to eq(true)
    dict
  end

  def shuffle
    @deck = @deck.shuffle
  end


  def deal_1
    return deck.pop
  end

end
