#Write a method duos that accepts a string as an argument and
#returns the count of the number of times the same character
#appears consecutively in the given string.

def duos(arg)
  count = 0
  (0...arg.length-1).each {|i| count+=1 if arg[i] == arg[i+1]}
  count
end

#Write a method sentence_swap that accepts a sentence and a hash as arguments.
#The method should return a new sentence where every word is replaced with
#it's corresponding value in the hash.
# If a word does not exist as a key of the hash, then it should remain unchanged.

def sentence_swap(sentence, hash)
  newSent = []
  sentence = sentence.split(" ")
  sentence.each do |word|
    if hash.has_key?(word)
      newSent << hash[word]
    else
      newSent << word
    end
  end
  newSent.join(" ")
end

#Write a method hash_mapped that accepts a hash, a proc, and a block.
#The method should return a new hash where each key is the result
#of the original key when given to the block.
#Each value of the new hash should be the result of the original
#values when passed into the proc.

def hash_mapped(hash, proc, &prc)
  newHash = {}
  keys = hash.keys
  keys = keys.map {|key| key = prc.call(key)}
  values = hash.values
  values = values.map {|value| value = proc.call(value)}
  (0...keys.length).each {|i| newHash[keys[i]] = values[i] }
  newHash
end

def hash_remapped(hash, proc, &prc)
  newHash = {}
  hash.each do |k,v|
    newHash[prc.call(k)] = proc.call(val)
  end
  newHash
end

#Write a method counted_characters that accepts a string as an argument.
#The method should return an array containing the characters of the string that appeared more than twice.
#The characters in the output array should appear in the same order they occur in the input string.

def counted_characters(str)
  hash =Hash.new(0)
  array = []
  str.each_char do |let|
    hash[let] +=1
  end
  hash.each do |k,v|
   array << k if v >2
 end
 array
end

def counted_characterrs(str)
  count = Hash.new(0)
  str.each_char {|let| count[let]+=1}
  count
    .select{|char, num| num>2}
    .keys
  end
#Write a method triplet_true? that accepts a string as an argument and
#returns a boolean
#indicating whether or not the string contains three of the
#same character consecutively.

def triplet_true(str)
  (0...str.length-2).each do |i|
    return true if str[i] == str[i+1] && str[i] == str[i+2]
  end
  false
end

#Write a method energetic_encoding that accepts a string and a hash as arguments.
#The method should return a new string where characters of the original string are replaced with the corresponding values in the hash.
#If a character is not a key of the hash, then it should be replaced with a question mark ('?'). Space characters (' ') should remain unchanged.

def energetic_encoding(str, hash)
  newStr = ""
  str.each_char do |i|
    if i == " "
      newStr += i
    elsif hash.has_key?(i)
      newStr += hash[i]
    else
      newStr += '?'
    end
  end
  newStr
end


#Write a method uncompress that accepts a string as an argument.
#The string will be formatted so every letter is followed by a number.
#The method should return an "uncompressed" version of the string
#where every letter is
#repeated multiple times given based on the number that
#appears directly after the letter.

def uncompress(str)
  newStr = ""
  str.each_char.with_index do |let, i|
    if i%2 == 0
      newStr += let*str[i+1].to_i
    end
  end
  newStr
end

#Write a method conjunct_select that accepts an array and one or more procs as
#arguments.
#The method should return a new array containing the elements that
#return true when passed into all of the given procs.

def conjunct_select(arr, *prc)
  array = []
  arr.each do |el|
    array << el if prc.all? {|p| p.call(el) == true}
  end
  array
end

def conjunct_reselect(arr, *prc)
  array.select {|el| prc.all? {|p| p.call(el)}}
end

#Write a method convert_pig_latin that accepts a sentence as an argument.
# The method should translate the sentence according to the following rules:

#words that are shorter than 3 characters are unchanged
#words that are 3 characters or longer are translated according
#to the following rules:
#if the word begins with a vowel, simply add 'yay' to the end of the word
#(example: 'eat'->'eatyay')
#if the word begins with a non-vowel, move all letters that come
#before the word's first vowel to the end of the word and add 'ay'
#(example: 'trash'->'ashtray')
#Note that if words are capitalized in the original sentence,
#they should remain capitalized in the translated sentence.
# Vowels are the letters a, e, i, o, u.

def first_vowel_index(word)
  vowels = 'aeiou'
  word.each_char.with_index do |let,i|
    if vowels.include?(let)
      return i
    end
  end
end

def string_any(word, &prc)
  word.each_char do |let|
    if prc.call(let)
      return true
    end
  end
  false
end

def convert_pig_latin(sent)
  sent = sent.split(' ')
  vowels = 'aeiouAEIOU'
  sent = sent.map do |word|
    if word.length > 2
      if vowels.include?(word[0])
        word = word + 'yay'
      else
        vowel = first_vowel_index(word)
        word = word[vowel..-1]+word[0...vowel]+'ay'
      end#vowel start check
    else
      word = word
    end#word length if
    if string_any(word) {|let| let == let.upcase}
      word = word.capitalize
    else
      word = word
    end
  end#map loop
  sent= sent.join(" ")
end


#reverberate
#Write a method reverberate that accepts a sentence as an argument.
#The method should translate the sentence according to the following rules:

#words that are shorter than 3 characters are unchanged
#words that are 3 characters or longer are translated according to the following rules:
#if the word ends with a vowel, simply repeat the word twice (example: 'like'->'likelike')
#if the word ends with a non-vowel, repeat all letters that come after the word's last vowel, including the last vowel itself (example: 'trash'->'trashash')
#Note that if words are capitalized in the original sentence, they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def last_vowel_index(word)
  vowels = 'aeiou'
  word = word.reverse
  word.each_char.with_index do |let,i|
    if vowels.include?(let)
      return word.length - (i+1)
    end
  end
end


def reverberate(sent)
  vowels = 'aeiouAEIOU'
  sent = sent.split(" ")
  sent = sent.map do |word|
    if word.length <3
      word = word
    else
      if vowels.include?(word[-1])
        word = word*2
      else
        word = word + word[last_vowel_index(word)..-1]
      end#vowel check
    end#word length check
    if string_any(word) {|let| let == let.upcase}
      word = word.capitalize
    else
      word = word
    end#capital check
  end#map loop
  sent = sent.join(" ")
end

#Write a method disjunct_select that accepts an array and one or more procs as arguments.
#The method should return a new array containing the elements that return true when passed into at least one of the given procs.

def disjunct_select(arr, *procs)
  array = []
  arr.each do |el|
    procs.each do |p|
      array << el if p.call(el) && !array.include?(el)
    end
  end
  array
end


#Write a method alternating_vowel that accepts a sentence as an argument.
#The method should return a new sentence where the words alternate between having their first or last vowel removed. For example:

#the 1st word should be missing its first vowel
#the 2nd word should be missing its last vowel
#the 3rd word should be missing its first vowel
#the 4th word should be missing its last vowel
#... and so on
#Note that words that contain no vowels should remain unchanged. Vowels are the letters a, e, i, o, u.

def alternating_vowel(sent)
  vowels = 'AEIOUaeiou'
  sent = sent.split(' ')
  newSent = []
  sent.each_with_index do |word, i|
    if word.length < 3
      newSent << word
    elsif i%2 == 0
      index = first_vowel_index(word)
      word.slice!(index)
      newSent << word
    elsif i%2 == 1
      index = last_vowel_index(word)
      word.slice!(index)
      newSent << word
    end
  end
  newSent.join(" ")
end

#Write a method silly_talk that accepts a sentence as an argument.
#The method should translate each word of the sentence according to the following rules:

#if the word ends with a vowel, simply repeat that vowel at the end of the word (example: 'code'->'codee')
#if the word ends with a non-vowel, every vowel of the word should be followed by 'b' and that same vowel (example: 'siren'->'sibireben')
#Note that if words are capitalized in the original sentence,
#they should remain capitalized in the translated sentence. Vowels are the letters a, e, i, o, u.

def silly_b(word)
  vowels='aeiouAEIOU'
  hash = {}
  newWord = ""
  word.each_char.with_index do |let, i|
    if vowels.include?(let)
      newLetters = let+'b'+let
      hash[let] = newLetters
    end
  end
  word.each_char.with_index do |let, i|
    if hash.has_key?(let)
      newWord += hash[let]
    else
      newWord += let
    end
  end
  newWord
end


def silly_talk(sent)
  vowels = 'aeiouAEIOU'
  sent = sent.split(" ")
  sent = sent.map do |word|
    if vowels.include?(word[-1])
      word = word+word[-1]
    else
      word = silly_b(word)
    end#end with vowel check
    if string_any(word) {|let| let == let.upcase}
      word = word.capitalize
    else
      word = word
    end #capital check
  end#map end
  sent.join(" ")
end


#Write a method compress that accepts a string as an argument.
#The method should return a "compressed" version of the string where streaks of
#consecutive letters are translated to a single appearance of the letter followed
#by the number of times it appears in the streak. If a letter does not form a
#streak (meaning that it appears alone), then do not add a number after it.

def compress(str)
  i = 0
  newStr = ""
  while i < str.length
    count = 1
    let = str[i]
    i +=1
    while let == str[i]
      count+=1
      i+=1
    end
    if count > 1
      newStr += let + count.to_s
    else
      newStr +=let
    end
  end
  newStr
end
