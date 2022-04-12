require_relative 'deck'
require 'byebug'
class Hand
  attr_reader :hand, :values, :score
  def initialize(cards=[])
    @hand = cards
    @score = []
    determine_score if @hand.length > 0
  end

  def trade(index)
    @hand.delete_at(index)
  end

  def render
    rendering = []
    @hand.each do |card|
      rendering << "#{card.symbol} of #{card.suit}"
    end
    p rendering
  end

  def determine_score
    pairs
    @score << 75 if flush?
    @score << 135 if royal_flush?
    @score << 120 if straight_flush?
    @score << 60 if straight?
    values.each {|value| @score << value}
    @score = score.sort.reverse
  end

  def values
    value_list = []
    @hand.each do |card|
      value_list << card.value
    end
    return value_list
  end

  HANDS = {
    'Pair' => 15,
    'Two Pair' => 30,
    'Three of a Kind' => 45,
    'Straight' => 60,
    'Flush' => 75,
    'Full House' => 90,
    'Four of a Kind' => 105,
    'Straight Flush' =>120,
    'Royal Flush' => 135
  }

  def royal_flush?
  return true if (flush? && values.all? {|value| value > 9})
  end

  def straight_flush?
    return true if (straight? && flush?)
  end

  def straight?
    value_list = values.sort
    straight = true
    (1..4).each do |idx|
      straight = false if value_list[idx] != value_list[idx-1] + 1
    end
    if straight == true
      return true
    end
    nil
  end

  def flush?
    flush = true
    suit = @hand[0].suit
    flush = false if @hand.any? {|card| card.suit != suit}
    if flush == true
      return true
    end
    nil
  end

  def pairs
    counter = 0
    counter2 = 0
    value_list = values
    value_list.each do |card|
      total = values.count(card)
      counter = total if total > counter
      counter2 = total if (total == 2 && counter >= 2)
    end
    @score << 30 if (counter ==2 && counter2 == 2)
    @score << 15 if (counter == 2 || counter2 ==2)
    @score << 45 if counter == 3
    @score << 90 if (counter == 3 && counter2 == 2)
    @score << 105 if counter == 4
  end

  def populate
    d = Deck.new
    d.shuffle
    5.times do
      @hand << d.deck.pop
    end
  end

  def populate_pair
    d = Deck.new
    counter = 0
    d.deck.each do |card|
      next if counter >=5
      if card.value == 2
        @hand << card
        counter +=1
      end
      if card.value == 3
        @hand << card
        counter +=1
      end
    end
  end
  #
  def populate_royal_flush
    d = Deck.new
    d.deck.each do |card|
      @hand << card if (@hand.length < 5 && card.value > 9)
    end
  end

end
