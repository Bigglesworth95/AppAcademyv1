require 'byebug'
class MinMaxStack
    def initialize(store = [])
      @store = store
      @min = []
      @max = []
    end

    def peek
      @store.last
    end

    def size
      @store.length
    end

    def empty?
      @store.empty?
    end

    def pop
      val = @store.pop
      if val == @min[-1]
        @min.pop
      elsif val == @max[-1]
        @max.pop
      end
      val
    end

    def max
      @max[-1]
    end

    def min
      @min[-1]
    end

    def push(val)
      @store << val

      if @max.length == 0 || val > @max[-1]
        @max << val
      end
      if @min.length == 0 || val < @min[-1]
        @min << val
      end
    end

  end
