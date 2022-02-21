require_relative "board.rb"
class Game
  def initialize(file)
    @board = Board.new(file)
  end

  def prompt_position
    p "Pick a position in the format, Y X"
  end

  def prompt_value
    p "what value do you want to put there?"
  end

  def valid_pos?(pos)
    pos.is_a?(Array) &&
      pos.length == 2 &&
      pos.all? { |x| x.between?(0, board.size - 1) }
  end

  def get_position
    move = nil
    until valid_pos(move)
      move = gets.chomp
      move = move.split(" ")
      move = move.map {|i| i.to_i}
    end
    move
  end

  def get_value
    value = gets.chomp
    value = value.to_i
  end

  def play
    until @board.solved?
      @board.render
      prompt_position
      position = get_position
      prompt_value
      value = get_value
      #debugger
      @board[position] = value
    end
    p 'Win!'
  end

end

g1 = Game.new("./puzzles/sudoku1.txt")
g2 = Game.new("./puzzles/sudoku1_almost.txt")
g2.play
