#Problem 1:
require "byebug"
def sum_recur(array)
  return array[0] if array.length == 1
  array[0] + sum_recur(array[1..-1])
end
#p sum_recur([1,2,3,4])
#Problem 2:

def includes?(array, target)
  if array.length == 0 && array[0] != target
    return false
  elsif array[0] == target
    return true
  else
    includes?(array[1..-1], target)
  end
end

#p includes?([1,2,3,4,5], 5)

# Problem 3:

def num_occur(array, target)
  return 0 if array.length == 0 && array[0] != target
  return 1 if array.length == 0 && array[0] == target
  num_occur = 0
  num_occur += 1 if array[0] == target
  num_occur + num_occur(array[1..-1], target)
end

#p num_occur([1,1,1,2,1], 2)
# Problem 4:

def add_to_twelve?(array)
  #debugger
  return false if array.length == 1
  if array[0] + array[1] == 12
    return true
  else
    false
  end
  if array.length > 1
    add_to_twelve?(array[1..-1])
  end
end

#p add_to_twelve?([10,2])

# Problem 5:

def sorted?(array)
  return true if array.length == 1
  if array[0] < array[1]
    sorted?(array[1..-1])
  else
    return false
  end
end

#p sorted?([1,2,3,1])
# Problem 6:

def reverse(string)
  return string[0] if string.length == 1
  string[-1] +reverse(string[0..-2])
end
