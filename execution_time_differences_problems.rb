require 'byebug'
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#
# def my_min_n2(list)
#   list.each do |num1|
#     counter = 0
#     list.each do |num2|
#       counter += 1 if num1 < num2
#     end
#     return num1 if counter == (list.length-1)
#   end
# end
#
# p my_min_n2(list)  # =>  -5
#
# def my_min_n(list)
#   min = list[0]
#   list.each do |num|
#     min = num if num < min
#   end
#   min
# end
#
# p my_min_n(list)

list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]


def largest_contiguous_subsum1(list) #TC = n^2 + 3n + k where k is the number of elements in a given subarray. This
  #reduces to n^2.
  arrays= []
  (0...list.length).each do |idx1|
    (idx1...list.length).each do |idx2|
      arrays << list[idx1..idx2]
    end
  end
  sums = []
  arrays.each do |subarr|
    sums << subarr.sum
  end
  sums.max
end

def largest_contiguous_subsum2(list)
  maxsum = -Float::INFINITY
  cursum = -Float::INFINITY
  list.each_with_index do |el, idx|
    cursum = el if cursum == -Float::INFINITY
    cursum += el if idx!=0
    cursum = el if el > cursum
    maxsum = cursum if cursum > maxsum
  end
  maxsum
end

p largest_contiguous_subsum2(list3)
