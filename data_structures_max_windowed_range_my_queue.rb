class MyQueue
  def initialize
    @store = []
  end

  def enqueue(val)
    @store << val
  end

  def dequeue
    val = @store[0]
    @store.delete_at(0)
    return val
  end

  def peek
    return @store[0]
  end

  def size
    return @store.length
  end

  def empty?
    return true if @store.length == 0
  end
end
