def proper_factors(num)
  factors = []
  (1..num/2).each {|i| factors << i if num%i == 0}
  factors
end

def aliquot_sum(num)
  arr = proper_factors(num)
  arr.sum
end

def perfect_number?(num)
  test = aliquot_sum(num)
  if num == test
    true
  else
    false
  end
end

def ideal_numbers(n)
  arr = []
  count = 1
  while arr.length < n
    arr << count if perfect_number?(count)
    count+=1
  end
  arr
end
