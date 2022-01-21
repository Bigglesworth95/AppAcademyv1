require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :cpu
  def initialize(size, hash)
    @players = []
    hash.each do |k, v|
      if hash[k] == true
        @players << Comp.new(k)
      else
        @players << HumanPlayer.new(k)
      end
    end
    @current_player = @players.first
    @board = Board.new(size)
  end#end init

  def switch_turn
    @players = @players.rotate!
    @current_player = @players.first
    p @current_player.player_mark
  end#end switch fx

  def play
    while @board.board_positions?
      mark = @current_player.player_mark
      @board.print
      position = @current_player.get_position(@board.legal_positions)
      @board.place_mark(position, mark)
      return "#{@current_player.player_mark} has won!" if @board.win?(@current_player.player_mark)
      switch_turn
    end #end while
    p 'draw'
  end#end fx

end#end game class

g = Game.new(4, X: false, Y:true, Z:false)
g.play
