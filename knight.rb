require_relative 'stepable'
require_relative 'piece'

class Knight < Piece
  include Stepable
  attr_reader :symbol, :color, :pos
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @symbol = '♞'.colorize(color)
  end

  def moves
    return valid_moves
  end

  def move_diffs
    [[-2, -1],
     [-1, -2],
     [-2, 1],
     [-1, 2],
     [1, -2],
     [2, -1],
     [1, 2],
     [2, 1]]
  end
end
