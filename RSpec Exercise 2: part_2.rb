#the goal was to devise this code by following and correcting the errors printed when running rspec. 
def palindrome?(str)
  newString = ""
  length = (str.length() -1)
  while length>=0
    newString += str[length]
    length-=1
  end
  if str == newString
    true
  else
    false
  end
end

def substrings(str)
subs = []
(0...str.length).each do |i|
  (i...str.length).each do |n|
    subs << str[i..n]
  end
end
subs
end

def palindrome_substrings(str)
  ps = []
  substrings(str).each do |word|
    if palindrome?(word) && word.length > 1
      ps << word
    end
  end
  ps
end
