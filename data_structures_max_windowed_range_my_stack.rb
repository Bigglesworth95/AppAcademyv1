class MyStack
  def initialize
    @store = []
  end
  def peek
    @store[-1]
  end

  def size
    @store.length
  end

  def empty?
    @store.length == 0
  end

  def pop
    @store.pop
  end

  def push(value)
    @store.unshift(value)
  end
end
