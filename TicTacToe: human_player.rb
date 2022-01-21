
class HumanPlayer
  attr_reader :player_mark
  def initialize(mark_value)
    @player_mark = mark_value
  end#end initialize

  def get_position
    p "Player %{@player_mark},
    Enter a valid position in the form of 'row col,' where row and col numbers between 0 and 2"
    position = gets.chomp
    position = position.split(" ")
    if position.length != 2
      p 'invalid input. need two numbers and a space'
      get_position
    end #end if
    position.each do |i|
      int = i.to_i
      str = int.to_s
      if i != str
        p 'invalid input. Need two numbers and a space'
        get_position
      end#end if
    end#end loop
    position = position.map(&:to_i)
    position
  end#end get_position
end#end class

#player1 = HumanPlayer.new(:O)
#position =  player1.get_position
#p position
