require_relative 'piece'
require_relative 'slideable'

class Bishop < Piece
  attr_reader :symbol, :color, :pos
  include Slideable
  def initialize (board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @symbol = '♝'.colorize(color)
    @move_dirs = DIAGONAL
  end

  def moves
    return valid_moves(pos)
  end

end
