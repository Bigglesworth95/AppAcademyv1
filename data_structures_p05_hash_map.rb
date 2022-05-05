# require_relative 'p04_linked_list'
require_relative "test_LL"
require 'byebug'
class HashMap
  include Enumerable
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
    @num_bucks = num_buckets
  end

  # def inspect
  #   @store.each do |bucket|
  #     p bucket
  #   end
  # end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! if @count == @store.length
    if self.include?(key)
      bucket(key).update(key, val)
    else
      bucket(key).append(key, val)
      @count +=1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if bucket(key).include?(key)
      bucket(key).remove(key)
      @count -=1
    end
  end

  def each
    self.store.each do |bucket|
      bucket.each {|link| yield [link.key, link.val]}
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten
    @num_bucks = @num_bucks * 2
    @store = Array.new(@num_bucks) {LinkedList.new}
    @count = 0
    old_store.each do |list|
      list.each do |node|
        self.set(node.key, node.val)
      end
    end
  end

  def bucket(key)
    return @store[key.hash % @num_bucks]
  end
end
