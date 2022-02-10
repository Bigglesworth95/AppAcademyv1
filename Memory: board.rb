#this is entirely original
require_relative "card.rb"
require "byebug"
class Board
  attr_reader :board
  def initialize(size)
    @board = Array.new(size) {Array.new(size)}
  end

  def populate
    cards = []
    (0...@board.length**2/2).each {|i| cards << Card.new(i)}
    (0...@board.length**2/2).each {|i| cards << Card.new(i)}
    @board.each_with_index do |row, idx|
      (0...row.length).each do |el|
        rand = rand(cards.length)
        @board[idx][el] = cards[rand]
        cards.delete_at(rand)
      end
    end
  end


  def render
    @board.each do |row|
      displayed_row = []
      row.each do |card|
        card = card.display
        displayed_row << card
      end
      p displayed_row
    end
  end

  def won?
    @board.each do |row|
      return false if row.any? {|card| card.face_up == false}
    end
    true
  end

  def reveal(guessed_pos)
    x, y = guessed_pos
    p @board[y][x].reveal
  end
  
end
