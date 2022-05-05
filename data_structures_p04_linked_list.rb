class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  # def inspect
  #   "#{@key}, #{@val}"
  # end

  def update(k, v)
    self.val = v
  end

  def remove
    self.prev.next = self.next if self.prev
    self.next.prev = self.prev if self.next
    self.next = nil
    self.prev = nil
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail
  def initialize
    @head = Node.new('Head')
    @tail = Node.new('Tail')
    @head.next = @tail
    @tail.prev = @head
  end

  # def inspect
  #   each {|link| p [link.key, link.val]}
  # end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    empty? ? nil : @head.next
  end

  def last
    empty? ? nil : @tail.prev
  end

  def empty?
    self.head.next == self.tail
  end

  def get(key)
    self.each do |node|
      return node.val if node.key == key
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    self.tail.prev.next = new_node
    new_node.next = self.tail
    new_node.prev = self.tail.prev
    self.tail.prev = new_node

    new_node
  end

  def update(key, val)
    self.each do |node|
      node.update(key, val) if node.key == key
      return node
    end
  end

  def each
    start = @head.next
    until start == @tail
      yield start
      start = start.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
