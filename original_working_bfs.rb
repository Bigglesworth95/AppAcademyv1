require 'byebug'
module Searchable


  def dfs(target_value=nil, &prc)
    #p self
    raise 'error' if [target_value, prc].none?
    prc ||= Proc.new { |node| node == target_value}
    return self if prc.call(self.value)
    children.each do |child|
      search_result = child.dfs(target_value)
      return search_result unless search_result.nil?
    end
    nil
  end



  def bfs(queue, target_value= nil, &prc)
    raise 'error' if [target_value, prc].none?
    prc ||= Proc.new {|node| node == target_value}
    return queue[0] if prc.call(queue[0].value)
    qq = queue
    until qq.empty?
      el = qq.shift
      el.children.each {|child| qq << child if child != nil}
      search_result = bfs(qq, target_value)
      return search_result unless search_result.nil?
    end
    nil
  end
end

class PolyTreeNode
  include Searchable
  attr_accessor :value, :parent, :children
  def initialize(value=nil)
    @value = value
    @parent = nil
    @children = []
  end

  def inspect
    {:value => value}.inspect
  end


  def parent=(node)
    return @parent = nil if node == nil
    if self.parent != nil
      self.parent.children.delete(self) if self.parent.children.include?(self) #if statement is test
    end
    @parent = node
    node.children << self if !node.children.include?(self)
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise 'error' if !self.children.include?(node)
    node.parent = nil
    self.children.delete(node)
  end
end


nodes = ('a'..'g').map {|value| PolyTreeNode.new(value)}
parent_index = 0
 nodes.each_with_index do |child, index|
   next if index.zero?
   child.parent = nodes[parent_index]
   parent_index +=1 if index.even?
 end
 p nodes
p nodes.first.bfs([nodes.first], 'f') #issue: we need it to search for the value specifically rather than the node.
