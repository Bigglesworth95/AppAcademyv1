require 'byebug'
class HashSet
  attr_reader :count, :num_bucks, :store

  def initialize(num_buckets = 8)
    @num_bucks = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count == @num_bucks
    s = self[key.hash]
    if !self[key.hash].include?(key)
      self[key.hash] << key
      @count +=1
    end
  end

  def include?(key)

    self[key.hash].include?(key)
  end

  def remove(key)
    if self[key.hash].include?(key)
      self[key.hash].delete(key)
      @count-=1
    end
  end

  private

  def [](num)
    @store[num % @num_bucks]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @num_bucks += @num_bucks
    @store = Array.new(@num_bucks) {Array.new}
    @count = 0
    old_store.flatten.each {|i| self.insert(i)}
  end
end
