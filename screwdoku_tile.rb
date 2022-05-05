require "byebug"

class Tile
  attr_reader :value
  def initialize(value, given=false)
    @value = value
    @given = given
  end

  def new_value(value)
    @value = value if @given == false
  end

  def to_s
    puts @value
  end

end
