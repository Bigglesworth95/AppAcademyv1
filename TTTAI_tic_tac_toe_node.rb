require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board, @next_mover_mark, @prev_move_pos =
    board, next_mover_mark, prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return @board.won? && @board.winner != evaluator
    end
    if @next_mover_mark == evaluator
      children.all? {|node| node.losing_node?(evaluator)}
    else
      children.any? {|node| node.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return @board.won? && @board.winner == evaluator
    end
    if @next_mover_mark == evaluator
      children.any? {|node| node.winning_node?(evaluator)}
    else
      children.all?{|node| node.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    (0..2).each do |col|
      (0..2).each do |row|
        pos = [col, row]
        next if @board[pos]
        new_board = @board.dup
        new_board[pos] = @next_mover_mark
        new_mark = (next_mover_mark == :x ? :o : :x)
        child = TicTacToeNode.new(new_board, new_mark, pos)
        children << child
      end
    end
    children
  end

end
