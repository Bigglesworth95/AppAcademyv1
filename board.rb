require 'byebug'
require_relative 'pieces'
require 'colorize'
require_relative 'display'
class Board
  attr_reader :board
  def initialize
    #
    @board = Array.new(8) {Array.new(8)}
    populate
  end


  def [](pos)
    x, y = pos[0], pos[1]
    @board[x][y]
  end

  def []= (pos, value)
    x, y = pos[0], pos[1]
    @board[x][y] = value
  end



  # def move_piece(start_pos, end_pos) #the issue has to do with inheritance of pos vs the changing of pos in the piece classes.
  #   #debugger
  #   piece = self[start_pos] #piece is a pawn; end pos is a null
  #   raise 'not a valid move' if !piece.moves.include?(end_pos)
  #   self[end_pos] = piece #end pos is now a pawn
  #   piece.pos = end_pos
  #   self[start_pos] = NullPiece.new(start_pos) #start pos is now a null
  #
  #
  #
  #   nil
  # end
  def move_piece(start_pos, end_pos) #the issue has to do with inheritance of pos vs the changing of pos in the piece classes.
    #debugger
    piece = self[start_pos] #piece is a pawn; end pos is a null
    raise 'not a valid move' if !piece.moves.include?(end_pos)
    self[end_pos] = piece #end pos is now a pawn
    piece.pos = end_pos
    self[start_pos] = NullPiece.new(start_pos) #start pos is now a null

    if in_check?(self[end_pos].color)
      undo(end_pos, start_pos)
      raise 'not a valid move -check'
    end

    nil
  end

  def undo(start_pos, end_pos)
    move_piece(start_pos, end_pos)
  end

  def in_check?(color, board=@board)
    king_pos = []
    board.each do |row|
      row.each do |piece|
        king_pos = piece.pos if piece.is_a?(King) && piece.color == color
      end
    end
    board.each do |row|
      row.each do |piece| #results in an issue with pawn...
        return true if piece.moves.include?(king_pos) && piece.color != color
      end
    end
    false
  end

  def checkmate?(color)
    return true if in_check?(color) && !valid_moves(color)
    false
  end


  def populate
    (0..7).each do |row|
      if row == 0 || row == 7
        fill_back_row(row)
      elsif row == 1 || row == 6
        fill_pawn_row(row)
      else
        fill_null_row(row)
      end
    end
  end

  def fill_back_row(row)
    pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook ]
    color = row == 0 ? :white : :black
    (0..7).each do |col|
      @board[row][col] = pieces[col].new(self, [row, col], color)
    end
  end

  def fill_pawn_row(row)
    color = row == 1 ? :white : :black
    (0..7).each do |col|
      @board[row][col] = Pawn.new(self, [row, col], color)
    end
  end

  def fill_null_row(row)
    (0..7).each do |col|
      @board[row][col] = NullPiece.new([row, col])
    end
  end

  def display(board=@board)
    #debugger
    d = Display.new(board)
    d.render
  end

end

# b = Board.new
# b.move_piece([1,3], [3,3])
# b.move_piece([6,4], [4, 4])
# b.move_piece([3,3],[4,4])
# #
# b.move_piece([7,3], [6,4])
# b.move_piece([1,4],[3,4])
# b.move_piece([6,4],[4,4])
# b.move_piece([0,3],[1,4])
# b.move_piece([4,4],[3,4])
# b.move_piece([1,4],[2,3])
# p b.in_check?(:white)
# b.display
