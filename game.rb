require_relative 'board'
require_relative 'human_player'

class Game
  def initialize(size, marks)
    @players = marks
    @player_num = marks.length
    @board = Board.new(size)
    @current_player = HumanPlayer.new(@players[0])
  end#end init

  def switch_turn
    @players = @players.rotate
    @current_player = HumanPlayer.new(@players[0])
    p @current_player.player_mark
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

g = Game.new(4,[:X, :O, :P])
p g.play
