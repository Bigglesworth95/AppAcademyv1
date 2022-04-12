module Stepable

  def valid_moves
    moves = []
    x, y = pos
    move_diffs.each do |dx, dy|
      new_p = [x + dx, y + dy]
      if in_board?(new_p)
        moves << new_p if @board[new_p].color != @board[pos].color
      end
    end
    moves
  end

end
