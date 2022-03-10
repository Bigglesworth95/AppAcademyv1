require 'byebug'
require_relative 'tile3.rb'

class Board
  attr_reader :gridsize
  def initialize(size, bombs)
    @gridsize = size
    @bomb_num = bombs

    generate_board
  end
  def lost?
    @grid.flatten.any? { |tile| tile.bombed? && tile.explored? }
  end
  def generate_board
    @grid = Array.new(@gridsize) do |row|
      Array.new(@gridsize) {|col| Tile.new(self, [row, col])}
    end
    plant_bombs
  end

  def plant_bombs
    bombs_planted = 0
    while bombs_planted < @bomb_num
      x = rand(0...@gridsize)
      y = rand(0...@gridsize)
      tile = @grid[x][y]
      if tile.bombed? == false
        tile.plant_bomb
        bombs_planted +=1
      end
    end
  end

  def render(reveal = false)
    @grid.map do |row|
      row.map do |tile|
        reveal ? tile.reveal : tile.render
      end.join(" ")
    end.join("\n")
  end

  def reveal
    render(reveal=true)
  end

  def win?
  end

  def lost?
  end

  def [](pos)
    x = pos[0]
    y = pos[1]
    @grid[x][y]
  end



end
