# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def prime(num)
  if num <=2
    return false
  end
  (2...num).each do |i|
    if num%i == 0
      return false
    end
  end
  true
end


def largest_prime_factor(num)
  (2...num).reverse_each do |i|
    if num%i == 0 && prime(i)
      return i
    end
  end
  num
end

def unique_chars? (string)
  hash = Hash.new(0)
  string.each_char {|let| hash[let]+=1}
  hash.each_value do |v|
    if v > 1
      return false
    end
  end
  true
end
#---------------------------------------------

def dupe_indices (arr)
  tempHash = Hash.new {|h,k| h[k] = []}
  arr.each_with_index do |n, i|
    tempHash[n] << i
  end
  fhash = Hash.new{|h,k| h[k] = []}
  tempHash.each {|k,v| fhash[k] = v if v.length>1}
  fhash
end


def ana_array(arr1, arr2)
  if arr1.length != arr2.length
    return false
  end
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)
  arr1.each {|i| hash1[i]+=1}
  arr2.each {|i| hash2[i]+=1}
  hash1.each do |k,v|
    if hash1[k] != hash2[k]
      return false
    end
  end
  true
end
#_----------------------------------------------------------
#better ways to write (based on Alvin)

def prime?(num)
  return false if num < 2
  (2...num).none? {|i|  num%i == 0}
end

def biggest_prime_factor(num)
  num.downto(2) do |factor|
    if num%factor == 0 && prime?(factor)
      factor
    end
  end
end

def unique_chars(string)
  already_seen = []
  sting.each_char do |let|
    if already_seen.include?(let)
      return false
    end
    already_seen << let
  end
  true
end

def dupe_indexes(arr)
  indexes = Hash.New {|h,k| h[k]=[]}
  array.each_with_index do |ele,i|
    indexes[ele] << i
  end
  indexes.select {|k,v| v.length>1}
end

def anagram_array(arr1, arr2)
  count1=ele_count(arr1)
  count2 = ele_count(arr2)
  count1 == count2
end

def ele_count(arr)
  counts=Hash.new(0)
  arr.each {|ele| counts[ele]+=1}
  counts
end
