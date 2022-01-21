require_relative 'board'
require_relative 'human_player'

class Game
  def initialize
    @player1 = HumanPlayer.new(:X)
    @player2 = HumanPlayer.new(:O)
    @board = Board.new()
    @current_player = @player1
  end#end init

  def switch_turn
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end#end if
    p "the current player is: #{@current_player.player_mark}"
  end#end switch fx

  def play
    while @board.board_positions?
      @board.print
      position = @current_player.get_position
      @board.place_mark(position, @current_player.player_mark)
      return "#{@current_player.player_mark} has won!" if @board.win?(@current_player.player_mark)
      switch_turn
    end #end while
    p 'draw'
  end#end fx

end#end game class

g = Game.new()
p g.play
