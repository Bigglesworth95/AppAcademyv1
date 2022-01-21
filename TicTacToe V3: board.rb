class Board
  def initialize(n)
    @board = Array.new(n) {Array.new(n) {|i| i = '_'}}
  end#end initialize

  def valid?(position)
    position.each do |i|
      if i > @board.length-1
        p 'not a valid position'
        return false
      else
        true
      end #end if
    end#end loop
  end#end valid fx

  def empty?(position)
    return true if @board[position[0]][position[1]] == '_'
    false
  end

  def place_mark (position, input)
    if valid?(position) && empty?(position)
      p 'position accepted.'
      @board[position[0]][position[1]] = input
    end#end if
  end#end place_mark fx

  def print
    @board.each {|row| p row}
  end#end print

  def win_row?(mark, grid = @board)
    length = @board.length
     grid.any? do |row|
      if row.all? {|el| el == mark} == true
        return true
        #end all
      end#end iff
    end#end any
    false
  end#end win_row

  def win_col?(mark)
    hash = Hash.new {|h,k| h[k] = []}
    @board.each do |row|
      row.each_with_index do |el, i|
        hash[i] << el
      end#end row each
    end# end grid each
    return true if win_row?(mark, hash.values)
    false
  end#end fx

  def win_diagonal?(mark)
    length = @board.length
    diagonal1 = []
    diagonal2 = []
    (0...length).each do |i|
      diagonal1 << @board [i][i]
      diagonal2<< @board[i][-1 - i]
    end#end each
    diagonals = [diagonal1, diagonal2]
    return true if win_row?(mark, diagonals)
    false
  end# end fx

  def win?(mark)
    return true if win_row?(mark) ==true || win_col?(mark)==true || win_diagonal?(mark)==true
    false
  end#end win

  def board_positions?
    @board.each do |row|
      if row.any? {|i| i == '_'}
        return true
      end#end if
    end#end each
    false
  end#end each
  def legal_positions
    positions = []
    @board.each_with_index do |row, idx|
      row.each_with_index do |ele, i|
        if empty?([idx, i])
          positions << [idx, i]
        end#end if
      end#end ele each
    end#end row each
    positions
  end#end fx

end #end class

#b = Board.new(3)
#b.print
#p b.legal_positions
#b.place_mark([0,0], :Z)
#b.print
#p b.legal_positions
