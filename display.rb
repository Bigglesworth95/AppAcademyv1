require 'colorize'
require_relative 'cursor'
class Display
  def initialize (board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  def render
    rendering = []
    @board.each do |row|
      temp = []
      row.each do |el|
        if !el.is_a?(NullPiece)
          temp << el.symbol[10] + "   "
        else
          #
          temp << el.symbol
        end
      end
      rendering << temp
    end
    rendering.each {|piece| p piece}
  end
end
