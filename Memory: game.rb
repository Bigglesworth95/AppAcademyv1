#this is entirely original

require_relative "board.rb"
require 'byebug'
class Game
  attr_reader :board
  def initialize(size)
    @board = Board.new(size)
    @last_guess = []
  end

  def over?
    @board.won?
  end

  def prompt
    p "Guess a number in the format x y"
  end

  def take_guess
    guess = gets.chomp()
    guess = guess.split(" ")
    guess = guess.map {|i| i.to_i}
  end

  def apply_guess(guess)
    @board.reveal(guess)
  end

  def guessed_card(guess)
    x, y = guess
    @board.board[y][x]
  end

  def guess_pair
    2.times do |i|
      prompt
      guess = take_guess
      apply_guess(guess)
      current_guess = guessed_card(guess)
      @board.render
      @last_guess = guessed_card(guess) if i == 0
      if current_guess.face_value != @last_guess.face_value
        current_guess.hide
        @last_guess.hide
      else
        @last_guess.reveal
      end
    end
    p "----------------------"
    @board.render
  end


  def play
    @board.populate
    until over?
      guess_pair
      sleep(20)
      system("clear")
    end
  end

end

g = Game.new(2)
#not populating properly for a board of size 2. Check population again and see what's up.
g.play
