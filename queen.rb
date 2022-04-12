require_relative 'piece'
require_relative 'slideable'

class Queen < Piece
  include Slideable
  attr_reader :symbol, :color, :pos
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @symbol = '♛'.colorize(color)
    @move_dirs =  HORI_VERTI + DIAGONAL
  end

  def moves
    return valid_moves(pos)
  end

end
