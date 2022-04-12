require 'byebug'
module Slideable
  HORI_VERTI = [
    [-1, 0],
    [0, -1],
    [0, 1],
    [1, 0]
  ].freeze

  DIAGONAL = [
  [-1, -1],
  [-1, 1],
  [1, -1],
  [1, 1]
].freeze


    def sliding_moves(pos, dir, moves)
      x, y = pos
      dx, dy = dir
      new_p = [x+dx, y+dy]
      #debugger
      if in_board?(new_p) && @board[new_p].empty?
        moves << new_p
        sliding_moves(new_p, dir, moves)
      elsif in_board?(new_p) && @board[new_p].color != @board[pos].color
        moves << new_p
        return moves
      else
        return moves
      end
    end


    def valid_moves(pos)
      cur_x, cur_y = pos
      moves = []
      @move_dirs.each do |dx, dy|
        dir = [dx, dy]
        sliding_moves(pos, dir, moves)
      end
      return moves
    end
  end
