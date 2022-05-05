require 'byebug'
def brute_two_sum?(arr, target_sum)
  sums = []
  (0...arr.length).each do |idx|
    num1 = arr[idx]
    (idx+1...arr.length).each do |idx2|
      num2 = arr[idx2]
      sums << num1 + num2 if num2.is_a?(Integer)
    end
  end
  p sums
  p sums.include?(target_sum)
end

arr2 = [5, 7]
#brute_two_sum?(arr, 6) # => should be true
#brute_two_sum?(arr, 10) # => should be false

def sort_two_sum?(arr, target_sum)
  left = 0
  right = arr.length-1
  while left < right
    case (arr[right] + arr[left]) <=> target_sum
    when -1
      left +=1
    when 0
      return true
    when 1
      right -= 1
    end
  end
  false
end

#p sort_two_sum?(arr, 6)
#sort_two_sum?(arr2, 10)
arr = [0, 1, 5, 7]

def hash_map(arr, target_sum)
  hash = Hash.new
  arr.each_with_index do |val, idx|
    return true if hash.values.include?(target_sum - val)
    hash[idx] = val
  end
  false
end
p hash_map(arr, 10)
