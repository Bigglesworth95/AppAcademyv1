def no_dupes?(arr)
  hash = Hash.new(0)
  arr.each do |i|
    hash[i] +=1
  end
  newArr = []
  hash.each {|k,v| newArr << k if v == 1}
  newArr
end
#p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
#p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
#p no_dupes?([true, true, true])

def no_consecutive_repeats?(arr)
  (0...arr.length).each do |i|
    if arr[i] == arr[i+1]
      return false
    end
  end
  true
end
#p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
#p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
#p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
#p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
#p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
  hash = Hash.new {|h,k| h[k]  = []}
  str.each_char.with_index {|let, i| hash[let] << i }
  hash
end
#p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
#p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  current_char = str[0]
  current_count = 0
  global_char = ""
  global_max = 0
  (0..str.length).each do |i|
    if current_count >= global_max
      global_char = current_char
      global_max = current_count
    end
    if str[i] == current_char
      current_count +=1
    else
      current_char = str[i]
      current_count = 1
    end
  end
  global_char*global_max
end

#p longest_streak('a')           # => 'a'
#p longest_streak('accccbbb')    # => 'cccc'
#p longest_streak('aaaxyyyyyzz') # => 'yyyyy
#p longest_streak('aaabbb')      # => 'bbb'
#p longest_streak('abc')         # => 'c'

def is_prime_pair(num1, num2)
  (2..num1/2).each do |i|
    if num1%i == 0
      return false
    end
  end
  (2..num2/2).each do |i|
    if num2%i == 0
      return false
    end
  end
  true
end

def bi_prime?(num)
  (2..num/2).each do |i|
    if num%i == 0 && is_prime_pair(i, num/i)
      return true
    end
  end
  false
end

#p bi_prime?(14)   # => true
#p bi_prime?(22)   # => true
#p bi_prime?(25)   # => true
#p bi_prime?(94)   # => true
#p bi_prime?(24)   # => false
#p bi_prime?(64)   # => false

def vigenere_cipher(str, sequence)
  alpha = ('a'..'z').to_a
  count = 0
  (0...str.length).each do |i|
    idx = alpha.index(str[i])
    cipher = sequence[count]
    str[i] = alpha[(idx+cipher)%26]
    count +=1
    if count >= sequence.length
      count = 0
    end
  end
  str
end
#p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
#p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
#p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
#p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
#p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  vowels = 'aieou'
  wVowels = []
  count = 0
  str.each_char {|let| wVowels << let if vowels.include?(let)}
  t = wVowels.pop
  wVowels.unshift(t)
  (0...str.length).each do |i|
    if vowels.include?(str[i])
      str[i] = wVowels[count]
      count+=1
    end
  end
  str
end

#p vowel_rotate('computer')      # => "cempotur"
#p vowel_rotate('oranges')       # => "erongas"
#p vowel_rotate('headphones')    # => "heedphanos"
#p vowel_rotate('bootcamp')      # => "baotcomp"
#p vowel_rotate('awesome')       # => "ewasemo"

class String
  def select (&prc)
    if prc == nil
      return ""
    end
    newString = ""
    self.each_char {|let| newString+=let if prc.call(let)==true}
    newString
  end

  def map!(&prc)
    self.each_char.with_index do |let, i|
      self[i] = prc.call(let, i)
    end
  end
end
#p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
#p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
#p "HELLOworld".select          # => ""
#word_1 = "Lovelace"
#word_1.map! do |ch|
#    if ch == 'e'
#        '3'
#    elsif ch == 'a'
#        '4'
#    else
#        ch
#    end
#nd
#p word_1        # => "Lov3l4c3"

#word_2 = "Dijkstra"
#word_2.map! do |ch, i|
#    if i.even?
#        ch.upcase
#    else
#        ch.downcase
#    end
#end
#p word_2        # => "DiJkStRa"

def multiply(n1, n2)
  if n1 == 0 || n2 == 0
    0
  elsif n2 == 1
    return n1
  end

  if n2 < 0
    -(n1 + multiply(n1, -(n2) -1))
  else
    n1 + multiply(n1, n2-1)
  end
end

#multiply(3, 5)        # => 15
#multiply(5, 3)        # => 15
#multiply(2, 4)        # => 8
#multiply(0, 10)       # => 0
#multiply(-3, -6)      # => 18
#multiply(3, -6)       # => -18
#multiply(-3, 6)       # => -18

def lucas_sequence(length)
  return [] if length == 0
  return [2] if length == 1
  return [2,1] if length == 2
  seq = lucas_sequence(length-1)
  next_el = seq[-1] + seq[-2]
  seq << next_el
end

#p lucas_sequence(0)   # => []
#p lucas_sequence(1)   # => [2]
#p lucas_sequence(2)   # => [2, 1]
#p lucas_sequence(3)   # => [2, 1, 3]
#p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
#p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
  (2...num).each do |n|
    if num%n == 0
      return [*prime_factorization(n), *prime_factorization(num/n)]
    end
  end
  [num]
end

def is_prime?(num)
  (2...num).each do |n|
    if num%n==0
      return false
    end
  end
  true
end
p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]
