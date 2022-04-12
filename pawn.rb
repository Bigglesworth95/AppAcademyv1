require_relative 'piece'

class Pawn < Piece
  attr_reader :symbol, :color, :pos
  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
    @symbol = '♟'.colorize(color)
  end

  def moves
    moves = forward_steps + side_caps
    moves = moves.select {|pos| in_board?(pos)}
  end

  def direction
    if color == :white
      dir = 1
    else
      dir = -1
    end
  end

  def new_p(x, y)
    pos = [x, y]
    pos if @board[pos].empty?
  end

  def cap?(p1, p2)
    true if in_board?(p2) && (@board[p1].color != @board[p2].color && !@board[p2].empty?)
  end

  def forward_steps
    x, y = pos
    dir = direction
    moves = []
    move1  =  new_p(x+(1*dir), y)
    move2 = new_p(x+(2*dir), y)

    if x == 1 || x == 6
      moves << move1 if move1
      moves << move2 if move1 && move2
    else
      moves << move1 if move1
    end
    moves
  end

  def side_caps
    #debugger
    caps = []
    x, y = pos
    dir = direction
    left_cap = [x + dir, y + dir]
    right_cap = [x+dir, y-dir]
    caps << left_cap if cap?(pos, left_cap)
    caps << right_cap if cap?(pos, right_cap)
    caps
  end
end
