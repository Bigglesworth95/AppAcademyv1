
def strange_sums(arr)
  count = 0
  arr.each do |n1|
    arr.each do |n2|
      if (n1+n2) == 0
        count+=1
      end
    end
  end
  count/2
end

#Write a method pair_product that accepts an array of numbers and a product as arguments.
#The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together.
#You may assume that the input array contains unique elements.

def pair_product(arr, num)
  arr.each_with_index do |n1, i|
    arr[i+1..-1].each do |n2|
      if (n1*n2) == num
        return true
      end
    end
  end
  false
end

#Write a method rampant_repeats that accepts a string and a hash as arguments.
#The method should return a new string where characters of the original string are repeated the number of times specified by the hash.
#If a character does not exist as a key of the hash, then it should remain unchanged.

def rampant_repeats(str, hash)
  newStr = ""
  str.each_char.with_index do |let, i|
    if hash.has_key?(let)
      newStr += let*hash[let]
    else
      newStr += let
    end
  end
  newStr
end


#Write a method perfect_square? that accepts a number as an argument.
#The method should return a boolean indicating whether or not the argument is a perfect square.
#A perfect square is a number that is the product of some number multiplied by itself.
#For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square(num)
  (1..num).each do |i|
    if i**2 == num
      return true
    end
  end
  false
end

#Write a method anti_prime? that accepts a number as an argument.
#The method should return true if the given number has more divisors than all positive numbers less than the given number.
#For example, 24 is an anti-prime because it has more divisors than any positive number less than 24.
#Math Fact: Numbers that meet this criteria are also known as highly composite numbers.
def divisors(num)
  count = 0
  (2...num).each do |n|
    if num%n == 0
      count+=1
    end
  end
  count
end

def anti_prime?(num)
  max = divisors(num)
  (1...num).all? {|i| max > divisors(i)}
end

#Let a 2-dimensional array be known as a "matrix". Write a method matrix_addition that accepts two matrices as arguments.
#The two matrices are guaranteed to have the same "height" and "width". The method should return a new matrix representing the sum of the two arguments.
#To add matrices, we simply add the values at the same positions:

def matrix_addition(matrix1, matrix2)
  outerLength = matrix1.length
  innerLength = matrix1[0].length
  newMatrix = []
  (0...outerLength).each do |arr|
    tempMatrix = []
    (0...innerLength).each do |ele|
      tempMatrix << matrix1[arr][ele] + matrix2[arr][ele]
    end
    newMatrix << tempMatrix
  end
  newMatrix
end


#Write a method mutual_factors that accepts any amount of numbers as arguments.
#The method should return an array containing all of the common divisors shared among the arguments.
#For example, the common divisors of 50 and 30 are 1, 2, 5, 10. You can assume that all of the arguments are positive integers.

def mutual_factors(*args)
  array = []
  hash = Hash.new(0)
  args.each do |num|
    (1..num).each do |n|
      if num%n == 0
        hash[n] +=1
      end
    end
  end
  hash.each {|k,v| array << k if v == args.length}
  array
end

def factors(num)
  (1..num).select {|i| num%i==0}
end

def mutual_factorz(*args)
  args = args.map {|n| factors(n)}
  args = args.inject {:&}
end

#The tribonacci sequence is similar to that of Fibonacci. The first three numbers of the tribonacci sequence are 1, 1, and 2.
#To generate the next number of the sequence, we take the sum of the previous three numbers. The first six numbers of tribonacci sequence are:

#1, 1, 2, 4, 7, 13, ... and so on

def tribonacci_number(n)
  if n == 1
    return 1
  elsif n == 2
    return 1
  elsif n == 3
    return 2
  else
    return (tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3))
  end
end

def tribonacci_num(n)
  seq = [1,1,2]
  while seq <= n
    seq << sq[-3] + seq[-2] + seq[-1]
  end
  seq[n-1]
end

#Write a method matrix_addition_reloaded that accepts any number of matrices as arguments.
#The method should return a new matrix representing the sum of the arguments.
#Matrix addition can only be performed on matrices of similar dimensions, so if all of the given matrices do not have the same "height" and "width", then return nil.

def matrix_addition_reloaded1(*matrices)
  matrix = matrices.first
  height = matrix.length
  width = matrix[0].length
  empty_matrix = Array.new(height) {[0]*width}

  matrices.inject(empty_matrix) do |m1, m2|
    return nil if m2.length != height or m2[0].length != width
    matrix_addition(m1, m2)
  end
end
matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

def matrix_addition_reloaded(*matrices)
  height = matrices[0].length
  width = matrices[0][0].length
  empty_matrix = Array.new(height) {[0]*width}
  matrices.each do |matrix|
    return nil if matrix.length != height or matrix[0].length != width
    empty_matrix = matrix_addition(empty_matrix, matrix)
  end
  empty_matrix
end

#Write a method squarocol? that accepts a 2-dimensional array as an argument.
#The method should return a boolean indicating whether or not any row or column
#is completely filled with the same element.
#You may assume that the 2-dimensional array has "square" dimensions, meaning it's height is the same as it's width.

def squarocol?(arr)
  arr.each do |row|
    if row.all?{|char| char == row[0]}
      return true
    end
  end
  colArray = []
  (0...arr.length).each do |idx|
    tArray = []
    arr.each do |row|
      tArray << row[idx]
    end
    colArray << tArray
  end
  if colArray.any?{|row| row.all?{|el| el == row[0]}}
    return true
  else
    false
  end
end

def squarecol?(grid)
  return true if grid.any? {|row| row.uniq.length ==1}
  return true if grid.transpose.any {|col| col.uniq.length == 1}
  false
end

#Write a method squaragonal? that accepts 2-dimensional array as an argument. T
#he method should return a boolean indicating whether or not the array contains all
#of the same element across either of its diagonals.
#You may assume that the 2-dimensional array has "square" dimensions,
#meaning it's height is the same as it's width.

def squaragonal?(arr)
  diagonalArray = []
  tArray = []
  (0...arr.length).each do |idx|
    tArray << arr[idx][idx]
  end
  diagonalArray << tArray
  tArray = []
  count = 0
  (0...arr.length).reverse_each do |idx|
    tArray << arr[count][idx]
    count+=1
  end
  diagonalArray << tArray
  return true if diagonalArray.any? {|list| list.uniq.length ==1}
  false
end

def adjacent_sums(arr)
  sums = []
  (0...arr.length-1).each do |i|
    sums << arr[i] + arr[i+1]
  end
  sums
end
def pascals_triangle(num)
  triangle = [[1]]
  while triangle.length < num
    newLevel = [1]
    newLevel += adjacent_sums(triangle.last)
    newLevel << 1
    triangle << newLevel
  end
  triangle
end

def is_prime?(n)
  if n <2
    return false
  end
  (2...n).each do |i|
    if n%i == 0
      return false
    end
  end
  true
end




def mersenne_prime(n)
  count = []
  x = 0
  while count.length < n
    test = (2**x)-1
    if is_prime?(test)
      count << test
    end
    x+=1
  end
  count.last
end

def word_code(str)
  alpha = ('a'..'z').to_a
  code = 0
  str.each_char {|let| code += alpha.index(let)}
  code +str.length
end
def triangular_sequence(n)
  sequence = []
  i = 1
  while sequence.length < n
    sequence << ((i * (i + 1)) / 2)
    i +=1
  end
  sequence
end

def triangular_word?(str)
  code = word_code(str)
  sequence = triangular_sequence(code)
  if sequence.include?(code)
    true
  else
    false
  end
end

def collapse(arr)
  (0...arr.length-1).each do |i|
    if arr[i]+1 == arr[i+1] || arr[i] == arr[i+1]+1
      return arr[0...i]+ arr[i+2..-1]
    end
  end
  arr
end

def consecutive_collapse(arr)
test = collapse(arr)
  if test == arr
    return test
  else
    return consecutive_collapse(test)
  end
end

def next_prime(number, i)
  primes = []
  n = 1
  if i < 0
    i = -i
    n = -n
  end
  while primes.length < i
    return nil if number < 0
    number+=n
    if is_prime?(number)
      primes << number
    end
  end
  primes[-1]
end

def pretentious_primes(numbers, n)
  numbers.map {|num| next_prime(num, n)}
end
