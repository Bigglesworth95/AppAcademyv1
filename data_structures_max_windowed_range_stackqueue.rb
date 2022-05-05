require 'byebug'
require_relative 'my_stack.rb'
class StackQueue
   attr_reader :outstack, :instack
    def initialize
      @outstack = MyStack.new
      @instack = MyStack.new
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

    def size
      return @store.length
    end

    def empty?
      return true if @store.length == 0
    end
end
