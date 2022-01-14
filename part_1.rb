def is_prime?(num)
  if num < 2
    return false
  end
  (2...num).each do |i|
    if num%i == 0
      return false
    end
  end
  true
end

def nth_prime(n)
  infinity = Float::INFINITY
  count = 0
  (0..infinity).each do |i|
    if is_prime?(i)
      count+=1
    end
    if count == n
      return i
    end
  end
end

def prime_range(min, max)
  arr = []
  (min..max).each {|i| arr << i if is_prime?(i)}
  arr
end
