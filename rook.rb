require_relative 'piece'
require_relative 'slideable'
require 'byebug'
class Rook < Piece
  include  Slideable
  attr_reader :symbol, :pos, :color

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @symbol = '♜'.colorize(color)
    @move_dirs = HORI_VERTI
  end

  def moves
    return valid_moves(pos)
  end

end
