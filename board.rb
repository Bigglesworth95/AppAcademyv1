require_relative "tile.rb"
require "byebug"
class Board
  attr_reader :puzzle, :column
  def initialize(filename)
    @puzzle = puzzle(filename)
    @columns = columns
    @boxes = boxes
  end

  def []= (position, value)
    y, x = position
    @puzzle[y][x].new_value(value)
  end

  def puzzle(filename)
    puzzle = File.open(filename)
    puzzle2 = []
    puzzle.each_line do |line|
      temp = []
      line.chomp.each_char do |num|
        temp << Tile.new(num) if num == "0"
        temp << Tile.new(num, true) if num != "0"
      end
      puzzle2 << temp
    end
    puzzle2
  end

  def columns
    columns = Array.new(9) {Array.new()}
    (0..8).each do |line|
      (0..8).each do |value|
        columns[value] << @puzzle[line][value]
      end
    end
    columns
  end

  def boxes
    boxes = []
    box1 = Array.new(3) {Array.new()}
    box2 = Array.new(3) {Array.new()}
    box3 = Array.new(3) {Array.new()}
    (0..8).each do |row|
      (0..8).each do |el|
        if row < 3
          box1[0] << @puzzle[row][el] if el < 3
          box1[1] << @puzzle[row][el] if el > 2 && el < 6
          box1[2] << @puzzle[row][el] if el > 5

        elsif row > 2 && row < 6
            box2[0] << @puzzle[row][el] if el < 3
            box2[1] << @puzzle[row][el] if el > 2 && el < 6
            box2[2] << @puzzle[row][el] if el > 5

          elsif row > 5
              box3[0] << @puzzle[row][el] if el < 3
              box3[1] << @puzzle[row][el] if el > 2 && el < 6
              box3[2] << @puzzle[row][el] if el > 5
        end
      end
    end
    boxes += box1 + box2 + box3
    boxes
  end

  def render
    map = []
    @puzzle.each do |line|
      values = ""
      line.each do |tile|
        values += (tile.value + " ")
      end
      map << values
    end
    map.each {|string| p string}
  end

  def row_solved?
    @puzzle.each do |row|
      row_vals = []

      row.each do |el|
        row_vals << el.value.to_i
      end#end el each

      if (1..9).to_a.any? {|i| !row_vals.include?(i)}
        return false
      end#end if
    end#end row each
    true
  end

  def column_solved?
    @columns.each do |col|
      col_vals = []

      col.each do |el|
        col_vals << el.value.to_i
      end#end el each

      if (1..9).to_a.any? {|i| !col_vals.include?(i)}
        return false
      end#end if
    end#end row each
    true
  end

  def boxes_solved?
    @boxes.each do |box|
      box_vals = []

      box.each do |el|
        box_vals << el.value.to_i
      end#end el each

      if (1..9).to_a.any? {|i| !box_vals.include?(i)}
        return false
      end#end if
    end#end row each
    true
  end

  def solved?
    return false if [row_solved?, column_solved?, boxes_solved?].any? {|i| i == false}
    true
  end

end

#b.render
#debugger
#p b.solved?
#p b1.solved?
