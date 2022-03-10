require 'byebug'
require_relative 'tree_node.rb'
class KnightPathFinder
  DELTAS =  [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  attr_reader :considered_positions, :root, :tree
  def initialize(position)
    @start_position = position
    @considered_positions = [position]
    @root = TreeNode.new(@start_position)
    @tree = build_move_tree
    @path = []
  end

  def build_move_tree
    nodes = [@root]
    tree = [@root]
    until nodes.empty?
      node = nodes.shift
      new_move_positions(node).each do |move|
        move = TreeNode.new(move)
        move.parent = node
        node.add_child(move)
        nodes << move
        tree << move
      end
    end
    tree
  end

  def find_path(end_pos)
    @root.bfs(end_pos)
    @path = []
    node = tree.select {|node| node.value == end_pos}[0]
    #debugger
    p trace_path_back(node)
  end

  def trace_path_back(node)
    return @path << node if node.parent == nil
    @path << node
    trace_path_back(node.parent)
    @path.reverse
  end

  def valid_moves(pos)
    x, y = pos.value
    v_moves = []
    DELTAS.each do |dx, dy|
      v_moves << [x+dx, y +dy] unless [x+dx, y+dy].any? {|pos| pos > 7} || [x+dx, y+dy].any? {|pos| pos < 0}
    end
    v_moves
  end

  def new_move_positions(pos)
    new_moves = valid_moves(pos).select {|move| !@considered_positions.include?(move)}
    @considered_positions.concat(new_moves)
    new_moves
  end

  def position=(pos)
    @start_position = pos
  end
end
kpf = KnightPathFinder.new([0,0])
kpf.find_path([7,7])
#board = []
# (0..9).each do |y|
#   row = []
#   (0..9).each do |x|
#     row << [y, x]
#   end
#   board << row
# end
# board. each {|row| p row}
