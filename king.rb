require_relative 'stepable'
require_relative 'piece'

class King < Piece
  include Stepable
  attr_reader :symbol, :color, :pos
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @symbol = '♚'.colorize(color)
  end


  def move_diffs
    [[-1, -1],
     [-1, 0],
     [-1, 1],
     [0, -1],
     [0, 1],
     [1, -1],
     [1, 0],
     [1, 1]]
  end

  def moves
    return valid_moves
  end

end
