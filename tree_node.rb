module Searchable
  def dfs(target_value=nil, &prc)
    raise 'missing target and proc' if [target_value, prc].none?
    prc ||= Proc.new {|node| node == target_value}
    return self if prc.call(self.value)
    children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end
    nil
  end

  def bfs(target_value=nil, &prc)
    raise 'missing target and proc' if [target_value, prc].none?
    nodes = [self]
    prc ||= Proc.new {|node| node.value == target_value}
    until nodes.empty?
      node = nodes.shift
      return node if prc.call(node)
      nodes.concat(node.children) if node.children != nil
    end
    nil
  end
end


class TreeNode
  include Searchable
  attr_accessor :value, :parent, :children
  def initialize(value = nil)
    @value, @parent, @children = value, nil, []
  end

  def inspect
    {:value => value}.inspect
  end

  def parent=(node)
    return @parent = nil if node == nil
    if self.parent != nil
      self.parent.children.delete(self) if self.parent.children.include?(self)
    end
    @parent = node
    node.children << self if !node.children.include?(self)
  end

  def add_child(node)#this looks sus to me. Shouldn't I be shoveling to children?
    node.parent = self
  end

  def remove_child(node)
    raise 'error' if !self.children.include?(node)
    node.parent = nil
    self.children.delete(node)
  end
end
