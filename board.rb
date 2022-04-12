require 'byebug'
require_relative 'player.rb'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) {Array.new(0, 0)}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
      @cups.map.with_index do |cup, idx|
        next if idx == 6 || idx == 13
        4.times do
          cup << :stone
        end
        #debugger
      end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos < 0 || start_pos > 13
    raise 'Starting cup is empty' if @cups[start_pos] == []
  end

  def make_move(start_pos, current_player_name)#most things are working. In their example, we didn't get a six stone cup. Have to check to see what the board looks like there. Make next turn first then try again.
    stones = @cups[start_pos]
    @cups[start_pos] = []
    goal = (current_player_name == @player1 ? 6 : 13)
    idx = start_pos + 1
    until stones.length == 0
      if idx.between?(0, 5) || idx.between?(7, 12)
        @cups[idx] << stones.pop
      elsif idx == goal
        @cups[idx] << stones.pop
      end
      if stones.length > 0
        idx +=1
        idx = 0 if idx == 14
      end
    end
    render
    next_turn(idx, goal)
  end

  def next_turn(ending_cup_idx, goal)
    return :prompt if ending_cup_idx == goal
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx if @cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    side1 = @cups[0..5]
    side2 = @cups[7..12]
    return true if [side1, side2].any? {|cup| cup.all?{|stones| stones.length == 0}}
    false
  end

  def winner
    #debugger
    p1 = @cups[6]
    p2 = @cups[13]
    determinant = p1 <=>p2
    if determinant == 0
      return :draw
    elsif determinant == 1
      return @player1
    else
      return @player2
    end
  end
end
 # p1 = Player.new('Dan', 1)
 # p p1.side
 # p2 = Player.new('Mike', 2)
 # b = Board.new('Dan', 'Mike')
 # p b.make_move(10, 'Mike')
