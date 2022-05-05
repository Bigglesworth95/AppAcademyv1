require 'byebug'
require_relative 'minmaxstack.rb'
class MinMaxStackQueue
  def initialize
    @instack = MinMaxStack.new
    @outstack = MinMaxStack.new
  end

  def size
    @instack.size + @outstack.size
  end

  def enqueue(val)
    @instack.push(val)
  end

  def dequeue
    queueify if @outstack.size == 0
    @outstack.pop
  end

  def queueify
    
    @outstack.push(@instack.pop) until @instack.empty?
  end

  def peek
    return @outstack.store[]
  end

  def empty?
    return true if @store.length == 0
  end

  def max
    arr = []
    arr << @instack.max if @instack.max != nil
    arr << @outstack.max if @outstack.max != nil
    arr.max
  end

  def min
    arr = []
    arr << @instack.min if @instack.min != nil
    arr << @outstack.min if @outstack.min != nil
    arr.min
   end
end
