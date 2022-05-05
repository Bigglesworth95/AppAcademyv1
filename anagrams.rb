require 'byebug'
def first_anagram?(str1, str2)
  all_anagrams(str1).include?(str2)
end

def permutations (string)
  string = string.split("")
  string = string.permutation.to_a
  string = string.map {|perm| perm = perm.join("")}
  string
end


def second_anagram?(str1, str2)
  str2 = str2.split("")
  str1.each_char do |char|
    idx = str2.find_index(char)
    str2.delete_at(idx)
  end
  return true if str2.length == 0
end

p second_anagram?('abc', 'cba')

def third_anagram?(str1, str2)
  str1 = str1.chars.sort.join
  str2 = str1.chars.sort.join
  return true if str1 == str2
end

p third_anagram?('abc', 'cba')

def fourth_anagram?(str1, str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  str1.each_char do |let|
    h1[let] +=1
  end
  str2.each_char do |let|
    h2[let] += 1
  end
  return true if h1 == h2
end

p fourth_anagram?('aabc', 'cba')

def fifth_anagram?(str1, str2)
  h = Hash.new{0}
  str1.each_char {|let| h[let] += 1}
  str2.each_char {|let| h[let] += 1}
  h.values.each do |i|
    return false if i%2 != 0
  end
  true
end
p fifth_anagram?('aabc', 'bac')
