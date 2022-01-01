#the goal was to devise this code by following and correcting the errors printed when running rspec. 
def partition(arr, num)
  less = []
  more = []
  arr.each do |i|
    if i >= num
      more << i
    else
      less << i
    end
  end
  [less, more]
end

def merge (hash1, hash2)
  newHash = {}
  hash2.each do |key, value|
    newHash[key] = value
  end
  hash1.each do |key, value|
    if newHash.key?(key)
    else
      newHash[key] = value
    end
  end
  newHash
end
def censor(sent, arr)
  sent = sent.split(" ")
  sent.map do |word|
    if arr.include?(word.downcase)
      star_vowels(word)
    end
  end
  sent.join(" ")
end

def star_vowels(word)
  vowels = 'aeiouAEIOU'
  word.each_char.with_index do |let, i|
    if vowels.include?(let)
      word[i] = "*"
    end
  end
  word
end

def power_of_two?(num)
  while num.to_f >1
    num = num/2.0
  end
  if num == 1
    true
  else
    false
  end
end
