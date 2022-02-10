#this is copied from the solution. I was able to work out everything but cpu player independetly within
#the alotted time limit. 
class HumanPlayer
  attr_accessor :previous_guess

  def initialize
    @previous_guess = nil
  end

  def get_input
    prompt
    parse(STDIN.gets.chomp)
  end

  def prompt
    puts "Please enter the position of the card you'd like to flip (eg, '2,3')"
    print "> "
  end

  def parse(string)
    string.split(",").map {|x| Integer(x)}
  end

  def receive_revealed_card(pos, value)
    #duck typing
  end

  def receive_match(_pos1, _pos2)
    puts "It's a match!"
  end
end
