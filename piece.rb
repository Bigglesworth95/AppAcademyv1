class Piece
  attr_accessor :pos
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  # def inspect
  #   symbol.inspect
  # end

  def to_s
    " #{symbol}  "
  end

  def in_board?(pos)
    return false if pos.any? {|coord| coord > 7 || coord < 0}
    true
  end

  def dif_color?(old_p, new_p)
    if !@board[new_p].is_a?(NullPiece)
      return true if @board[new_p].color != @board[old_p].color
    end
    false
  end

  def empty?
    false
  end

end
