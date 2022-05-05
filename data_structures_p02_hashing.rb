require 'byebug'
class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    each_with_index.inject(0) do |i_h, (el, i)|
      [i_h, el, i]
      (el.hash + i.hash) ^ i_h
    end
  end
end

class String
  def hash
    num = 0
    self.each_char.with_index do |char, i|
      char = char.ord
      i = 2**i
      num += (char.hash * i)
    end
    num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort_by(&:hash).hash
  end
end
