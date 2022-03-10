require 'byebug'
class Stack
  def initialize(list)
    @list = list
  end

  def push(el)
    @list << el
  end

  def pop
    @list.pop
  end

  def peek
    p @list[-1]
  end
end

# s = Stack.new([1,2,3,4])
# s.push(5)
# s.pop
# s.pop
# s.peek
class Queue
  def initialize(list)
    @list = list
  end

  def enqueue(el)
    @list << el
  end

  def dequeue
    @list.shift
  end

  def peek
    p @list[0]
  end
end
# q = Queue.new([])
# q.enqueue(1)
# q.enqueue(2)
# q.enqueue(3)
# q.dequeue
# q.peek

class Map
  def initialize(k1, v1)
    @map = [[k1, v1]]
  end

  def [](key)
    idx = key_index(key)
    @map[idx]
  end

  def set(key, value)
    if !key_index(key)#need a has? method
      @map << [key, value]
    else
      @map[key] = value#need to define [] method so that it returns the second index of index with specified key
    end
  end

  def get(key)
    #debugger
    p self[key][1]
  end

  def delete(key)
    @map.delete_at(key_index(key))
  end

  def show
    @map.each {|tuple| p tuple}
  end

  private
  def key_index(key)
    @map.each_with_index do |tuple, idx|
      tuple.each do |el|
        if el == key
          return idx
        end
      end
    end
    false
  end
end

m = Map.new('dan', 26)
m.set('mike', 27)
p m['dan']
m.get('mike')
m.set('abigail', 20)
m.get('abigail')
m.delete('abigail')
m.show
