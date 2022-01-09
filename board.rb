class Board
  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) {Array.new(n, :N)}
    @size = n * n
  end

  def [](arr)
    row = arr[0]
    column = arr[1]
    @grid[row][column]
    #row, col = position
  end

  def []= (position, value)
    #row,col = position
    #@grid[row][col] = value
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    count = 0
    @grid.each do |arr|
      arr.each {|ele| count +=1 if ele == :S}
    end
    count

    #@grid.flatten.count{|ele| = :S}
  end

  def attack(position)

    if self[position] == :S
      self[position] = :H
      p "you sunk my battleship!"
      true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    ship_num = @size*0.25
    while self.num_ships < ship_num
      counter =+1
      rand_row = rand(0...@grid.length)
      rand_column = rand(0...@grid.length)
      pos = [rand_row, rand_column]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    newGrid = []
    @grid.each do |arr|
      tempArr = []
      arr.each do |ele|
        if ele == :S
          tempArr << :N
        else
          tempArr << ele
        end
      end
      newGrid << tempArr
    end
    newGrid

    #@grid.map do |row|
      #row.map do |ele|
        #if ele == :S
          #:N
        #else
          #ele
  end

  def self.print_grid(grid)
    grid.each do |arr|
      puts arr.join(" ")
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
