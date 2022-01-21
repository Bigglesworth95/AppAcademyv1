

class Comp
  attr_reader :player_mark
  def initialize(mark_value)
    @player_mark = mark_value

  end#end initialize



  def get_position(legal_positions)
    return legal_positions.sample
  end#end fx
end#end class
#c = Comp.new(:Y)
#positions = [[1, 2], [3, 4], [4, 3]]
#p c.get_position(positions)
