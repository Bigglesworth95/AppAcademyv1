require_relative 'board3.rb'
require 'byebug'
class Game
  def initialize(size, bombs)
    @board = Board.new(size, bombs)
  end

  def lose?
    @board.lost?
  end

  def win?
    @board.win?
  end

  def play
    until lose? || win?
      puts @board.render
      puts 'pick an action: F for flag or E for Explore, R for reveal'
      action = get_action
      puts 'Pick a position to apply your action to: x,y'
      pos = get_pos
      apply_move(action, pos)
    end
    if win?
      p 'you win!'
      @board.reveal
    else
      p 'You lose :('
      @board.reveal
    end
  end

  def get_action
    gets.chomp
  end

  def get_pos
    pos = gets.chomp
    parse(pos)
  end

  def apply_move(action, pos)
    case action
    when 'F'
      @board[pos].toggle_flage
    when 'E'
      @board[pos].explore
    when 'R'
      puts @board.reveal
    end
  end

  def parse(pos)
    pos = pos.split(",")
    pos = pos.map {|i| i.to_i}
  end

end
g = Game.new(9, 10)
g.play
