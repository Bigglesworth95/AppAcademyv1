class Card
  attr_reader :value, :suit, :symbol
  def initialize(value, suit)
    @value = value
    @suit = suit
    @symbol = symbol_picker(value)
  end

  def symbol_picker(value)
    symbols = ['Jack', 'Queen', 'King', 'Ace']
    return value.to_s if value >1 && value <11
    if value == 11
      return 'Jack'
    elsif value == 12
      return 'Queen'
    elsif value == 13
      return 'King'
    elsif value == 14
      return 'Ace'
    end
  end

end
