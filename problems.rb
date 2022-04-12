#require 'byebug'
def my_uniq(array)
  arr = []
  array.each {|el| arr << el unless arr.include?(el) }
  arr
end

def two_sum(arr)
  new_arr = []
  (0...arr.length-1).each do |idx|
    #debugger
    (idx+1..arr.length-1).each do |idx2|
      el1 = arr[idx]
      el2 = arr[idx2]
      new_arr << [idx, idx2] if el1 + el2 == 0
    end
  end
  new_arr
end

rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]

def my_transpose(arr)
  new_arr = Array.new(arr.length) {Array.new}
  arr.each_with_index do |row, idx|
    row.each_with_index do |el, idx2|
      new_arr[idx2] << el
    end
  end
  new_arr
end

stocks = [9, 3, 4, 2, 5, 1, 3, 1, 0]
def stock_picker(stocks)
  pair = []
  max = 0
  (0...stocks.length-1).each do |i|
    left = stocks[i]
    (i+1..stocks.length-1).each do |i2|
      right = stocks[i2]
      dif = right - left
      if dif > max
        max = dif
        pair = [left, right]
      end
    end
  end
  pair
end

class Tower_of_hanoi
  attr_reader :towers
  def initialize
    @towers = [
      [3, 2, 1],
      [],
      []]
    end

  def play
    while !won?
      display
      move
      won?
    end
  end

  def display
    @towers.each_with_index do |row, idx|
      p "tower #{idx}", row
    end
  end

  def won?
    return true if @towers[-1].length == 3
  end

  def get_move
    p 'which tower would you like to pop from?'
    first_tower = gets.chomp.to_i
    p 'which tower would you like to move to'
    second_tower = gets.chomp.to_i
    move = [first_tower, second_tower]
  end


  def move(move)
    var = false
    first_tower = move[0]
    second_tower = move[1]
    while var == false
      piece = @towers[first_tower].pop
      if @towers[second_tower][-1] == nil  || piece < @towers[second_tower][-1]
        @towers[second_tower] << piece
        var = true
      else
        @towers[first_tower] << piece
        raise 'cannot move onto smaller disc'
      end
    end
  end

  # def move(move)
  #   var = false
  #   while var == false
  #     p 'which tower would you like to pop from?'
  #     first_tower = gets.chomp.to_i
  #     piece = @towers[first_tower].pop
  #     p 'which tower would you like to move to'
  #     second_tower = gets.chomp.to_i
  #     if @towers[second_tower][-1] == nil  || piece < @towers[second_tower][-1]
  #       @towers[second_tower] << piece
  #       var = true
  #     else
  #       @towers[first_tower] << piece
  #     end
  #   end
  # end

end
