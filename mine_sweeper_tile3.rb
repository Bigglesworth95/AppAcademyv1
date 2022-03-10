require 'byebug'
class Tile
  DELTAS = [
    [0,1],
    [0,-1],
    [1,1],
    [1,0],
    [1,-1],
    [-1,-1],
    [-1,0],
    [-1,-1]
  ].freeze

  attr_reader :pos
  def initialize(board, pos)
    @board = board
    @pos = pos
    @bombed, @flagged, @explored = false
  end

  def inspect
    {
      bombed: bombed?,
      flagged: flagged?,
      explored: explored?
    }.inspect
  end

  def bombed?
    @bombed
  end

  def flagged?
    @flagged
  end

  def explored?
    @explored
  end

  def plant_bomb
    @bombed = true
  end

  def neighbors
    x, y = @pos
    adjacent_coords = DELTAS.map do |dx, dy|
      [dx+x, dy+y]
    end.select do |coord|
      coord.all?{|i| i.between?(0, @board.gridsize-1)}
    end
    adjacent_coords = adjacent_coords.map {|coord| coord = @board[coord]}
  end

  def neighboring_bomb_count
    neighbors.select {|neighbor| neighbor.bombed? == true}.count
  end

  def explore
    return self if explored?
    return self if flagged?
    @explored = true
    if !bombed? && neighboring_bomb_count ==0
      #debugger
      neighbors.each {|neighbor| neighbor.explore}
    end
    self
  end

  def render
    if flagged?
      "F"
    elsif explored?
      neighboring_bomb_count == 0 ? "_" : neighboring_bomb_count.to_s
    else
      '*'
    end
  end

  def reveal
    if flagged?
      bombed? ? "F" : "f"
    elsif bombed?
      explored? ? "X" : "B"
    else
      neighboring_bomb_count == 0 ? "_" : neighboring_bomb_count.to_s
    end
  end

  def toggle_flag
    @flagged = !@flagged
  end
end
