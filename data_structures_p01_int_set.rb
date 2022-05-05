require 'byebug'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    return false if @store[num]
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    return nil unless include?(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    return @store[num]
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length-1)
  end

  def validate!(num)
    raise 'Out of bounds' unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @num_buck = num_buckets
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self[num].include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @num_buck]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @num_bucks = num_buckets
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @num_bucks == @count
    if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
  end

  def remove(num)
    if self[num].include?(num)
      self[num].delete(num)
      @count -=1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    idx = num % num_buckets
    @store[idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @count = 0
    @num_bucks += @num_bucks

    @store = Array.new(@num_bucks) {Array.new}
    old_store.flatten.each {|num| insert(num)}
  end
end
