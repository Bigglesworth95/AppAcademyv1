#This sheet was empty. The task was to run rspec, read the errors, and then devise this sheet based on the error output. 

def hipsterfy(str)
  vowels = 'aeiou'
  i = str.length() -1
  while i > 0
    if vowels.include?(str[i])
      return str[0...i]+str[i+1..-1]
    end
    i-=1
  end
  str
end

def vowel_counts(str)
  hash = Hash.new(0)
  vowels = 'aeiou'
  str.downcase!
  str.each_char {|let| hash[let]+=1 if vowels.include?(let) }
  hash
end

def caesar_cipher(str, num)
  alpha = 'abcdefghijklmnopqrstuvwxyz'
  str.each_char.with_index do |let, i|
    if alpha.include?(let)
      index = alpha.index(let)
      shift = (num+index)%alpha.length
      str[i] = alpha[shift]
    end
  end
  str
end
puts caesar_cipher('aaa1', 1)
