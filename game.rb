require_relative 'board'
require_relative 'human'
class Game
  def initialize
    @board = Board.new
    @p1 = Human.new
    @p2 = Human.new
  end

  def play
    p 'lets play chess!'
    @board.display
    while !@board.checkmate?(:white) && !@board.checkmate?(:black)
      move = @p1.get_move
      make_move(move[0], move[1])
      @board.display
      move = @p2.get_move
      make_move(move[0], move[1])
      @board.display
    end
    p 'game over'
  end

  def make_move(start_pos, end_pos)
    @board.move_piece(start_pos, end_pos)
  end
end

g = Game.new
g.play
