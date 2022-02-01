require "byebug"
def createMaze1
  maze = []
  maze << ["*","*","*","*","*","O","*",]
  maze << ["S"," "," "," ","*"," ","*",]
  maze << ["*"," ","*"," ","*"," ","*"]
  maze << ["*"," ","*"," "," "," ","*"]
  maze << ["*"," ","*","*","*"," ","*"]
  maze << ["*"," "," "," ","*"," ","*",]
  maze << ["*","*","*","*","*","*","*",]
  maze
end
maze = createMaze1

def valid_moves(maze)
  valid_moves = []
  (0...maze.length).each do |idx1|
    (0...maze[idx1].length).each do |idx2|
      if maze[idx1][idx2] == " " || maze[idx1][idx2] == "O"
        valid_moves << [idx1, idx2]
      end#end if
    end#end inner each
  end#end outer each
  valid_moves
end#end fx

def maze_coordinates(maze)
  coordinates = []
  (0...maze.length).each do |idx1|
    (0...maze[idx1].length).each do |idx2|
      coordinates << [idx1, idx2]
    end#end inner each
  end#end outer each
  coordinates
end#end fx
#valid_moves.each {|line| p line}

def start(maze, coordinates)
  coordinates.each do |i|
    if maze[i[0]][i[1]] == "S"
      return i
    end#end if
  end#end each
end#end fx

def theEnd(maze, coordinates)
  coordinates.each do |i|
    if maze[i[0]][i[1]] == "O"
      return i
    end#end if
  end#end each
end#end fx

def nextMove(valid_moves, currentMove)
  nextMoves = []
  x = currentMove[1]
  y = currentMove[0]
  right = [y, x+1]
  left = [y, x-1]
  down = [y-1, x]
  up = [y+1, x]
  while nextMoves.length == 0
    if valid_moves.include?(down)
      nextMoves << down
    end

    if valid_moves.include?(up)
      nextMoves << up
    end

    if valid_moves.include?(left)
      nextMoves << left
    end

    if valid_moves.include?(right)
      nextMoves << right
    end

  end#end while
  nextMoves
end#end fx

def maze_solver (maze)
  valid_moves = valid_moves(maze)
  coordinates = maze_coordinates(maze)
  start = start(maze, coordinates)
  theEnd = theEnd(maze, coordinates)
  currentMove = start
  #debugger
  moves = nextMove(valid_moves, start)
  while currentMove!= theEnd

    currentMove = moves.shift
    newMoves = nextMove(valid_moves, currentMove)
    newMoves.each { |el| moves << el}
    p currentMove
  end
  p hash[currentMove]
end#end solver

maze_solver(maze)
