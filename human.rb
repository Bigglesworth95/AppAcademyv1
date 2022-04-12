class Human
  def get_move
    move = []
    p 'which piece would you like to move in the format # #?'
    move << gets.chomp.split(' ').map {|i| i = i.to_i}
    p 'make a move in the board with the format # #'
    move << gets.chomp.split(' ').map {|i| i = i.to_i}
    move
  end
end
