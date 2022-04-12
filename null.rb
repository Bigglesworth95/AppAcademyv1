require 'singleton'
require_relative 'piece'
class NullPiece < Piece
  attr_reader :symbol, :color
  def initialize (pos)
    @symbol = pos
    @color = :none
  end

  def empty?
    true
  end

  def moves
    []
  end
end
