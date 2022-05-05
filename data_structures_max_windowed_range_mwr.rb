require "byebug"
require 'benchmark'
require_relative 'mmsq.rb'
def mwr1(arr, w)
    current_max_range = -1/0.0
  (0..arr.length-w).each do|idx|
    window = arr[idx..idx+w-1]
    max = window.max
    min = window.min

    range = max-min
    current_max_range = range if range > current_max_range
  end
  current_max_range
end
# array = [1, 2, 3, 5]
# p mwr1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p mwr1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p mwr1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p mwr1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
def mwr2(arr, w)
  current_max_range = []
  s = MinMaxStackQueue.new
  arr.each do |el|
    s.enqueue(el)

    if s.size == w
      current_max_range << (s.max - s.min) if ( current_max_range[-1]==nil || (s.max-s.min) > current_max_range[-1] )
      s.dequeue
    end
  end
  current_max_range[-1]
end
 p mwr2([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
 p mwr2([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
 p mwr2([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
 p mwr2([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

 puts Benchmark.measure {
   50000.times do
     mwr2([1, 0, 2, 5, 4, 8], 2)
   end
 }
