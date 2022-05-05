require 'byebug'
class Maze

  ALPHAS = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1],
  ]
  attr_reader :maze, :start, :end
  def initialize(file)
    @maze = load_map(file)
    @start = s_e("S")
    @end = s_e('E')
  end

  def load_map(file)
    maze = []
    File.open(file).each_line do |line|
      line = line.chomp.split("")
      maze << line
    end
    maze
  end

  def render
    @maze.each do |line|
      p line
    end
  end

  def [] (location)
    x, y = location
    return @maze[x][y]
  end

  def is_wall?(place)
    return true if self[place] == '*'
    false
  end

  def s_e(goal)
    place = []
    @maze.each_with_index do |line, idx1|
      line.each_with_index do |val, idx2|
        place = [idx1, idx2] if val == goal
      end
    end
    place
  end

  def in_maze?(place)
    x, y = place
    return false if x < 0 or x >= @maze[0].length
    return false if y < 0 or y >= @maze[0].length
    true
  end

  def add(place1, place2)
    x, y = place1.flatten
    a, b = place2.flatten
    return [x + a, y+b]
  end

  def neighbors(place)
    potential_neighbors = []
    ALPHAS.each do |modifier|
      new_neighbor = add(modifier, place)
      if in_maze?(new_neighbor) && !is_wall?(new_neighbor)
        potential_neighbors << new_neighbor
      end
    end
    potential_neighbors
  end

  def travel_path(path)
  end

end

class MazeSolver
  def initialize(maze)
    @maze = maze
    @start = @maze.start
    @end = @maze.end
  end

  def naive
    current_place = @start
    while current_place != @end
      neighbors = @maze.neighbors(current_place)
      current_place = neighbors.sample
      p current_place
    end
    p 'finished'
  end

end

m = Maze.new('maze1.txt')
solver = MazeSolver.new(m)
solver.naive
