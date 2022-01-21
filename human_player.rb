
class HumanPlayer
  attr_reader :player_mark
  def initialize(mark_value)
    @player_mark = mark_value
  end#end initialize

  def get_position(legal_positions)
    p "Player %{@player_mark},
    Enter a valid position in the form of 'row col,' where row and col numbers between 0 and 2"
    position = gets.chomp
    position = position.split(" ")
    position.each do |i|
      int = i.to_i
      str = int.to_s
      if i != str
        p 'invalid input. Need two numbers and a space'
        get_position(legal_positions)
      end#end if
    end#end loop
    position = position.map(&:to_i)
    if !legal_positions.include?(position)
      p 'must be a legal position'
      get_position(legal_positions)
    end#end if
    position
  end#end get_position
end#end class

#player1 = HumanPlayer.new(:O)
#p player1.player_mark
#position =  player1.get_position([[0,0]])
#p position
