# Write a method, all_vowel_pairs, that takes in an array of words and returns all pairs of words
# that contain every vowel. Vowels are the letters a, e, i, o, u. A pair should have its two words
# in the same order as the original array.
#
# Example:
#
# all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])   # => ["action europe", "tear impromptu"]

#def all_vowel_pairs(words)
  #vowels = 'aeiou'.split("")
#  vowel_pairs = []
#  words.each do |word|
#    words.each do |otherWord|
#      pair = (word + otherWord).split("")
#      checker = vowels - pair
#      if checker == []
#        vowel_pairs << [word, otherWord]
#      end
#    end
#  end
#  de_duped_pairs = []
#  vowel_pairs.each do |pair1|
#    if !de_duped_pairs.include?(pair1.reverse)
#      de_duped_pairs << pair1
#    end
#  end
#  de_duped_pairs.map {|ele| ele.join(" ")}
#end

#def all_vowel_pairs(words)
#  vowels  = 'aeiou'
#  vowel_pairs = []
#  words.each_with_index do |word, idx|
#    words[idx..-1].each do |word2|
#      checker = word+ " "+word2
#      all_vowels = true
#      vowels.each_char do |vowel|
#        if !checker.include?(vowel)
#          all_vowels = false
#        end
#      end
#      if all_vowels == true
#        vowel_pairs << checker
#      end
#    end
#  end
#  vowel_pairs
#end

def all_vowel_pairs(words)
  pairs = []
  vowels = 'aeiou'.split("")
  words.each_with_index do |word1, idx1|
    words.each_with_index do |word2, idx2|
      pair = word1 + " " + word2
      pairs << pair if idx2 > idx1 && vowels.all? {|vow| pair.include?(vow)}
    end
  end
  pairs
end

p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])

#p all_vowel_pairs(["goat", "action", "tear", "impromptu", "tired", "europe"])
# Write a method, composite?, that takes in a number and returns a boolean indicating if the number
# has factors besides 1 and itself
#
# Example:
#
# composite?(9)     # => true
# composite?(13)    # => false
def composite?(num)
  (2...num).each do |n|
    if num % n == 0
      return true
    end
  end
  false
end


# A bigram is a string containing two letters.
# Write a method, find_bigrams, that takes in a string and an array of bigrams.
# The method should return an array containing all bigrams found in the string.
# The found bigrams should be returned in the the order they appear in the original array.
#
# Examples:
#
# find_bigrams("the theater is empty", ["cy", "em", "ty", "ea", "oo"])  # => ["em", "ty", "ea"]
# find_bigrams("to the moon and back", ["ck", "oo", "ha", "at"])        # => ["ck", "oo"]
def find_bigrams(str, bigrams)
  pairs = bigrams.select {|pair| str.include?(pair)}
end


class Hash
    # Write a method, Hash#my_select, that takes in an optional proc argument
    # The method should return a new hash containing the key-value pairs that return
    # true when passed into the proc.
    # If no proc is given, then return a new hash containing the pairs where the key is equal to the value.
    #
    # Examples:
    #
    # hash_1 = {x: 7, y: 1, z: 8}
    # hash_1.my_select { |k, v| v.odd? }          # => {x: 7, y: 1}
    #
    # hash_2 = {4=>4, 10=>11, 12=>3, 5=>6, 7=>8}
    # hash_2.my_select { |k, v| k + 1 == v }      # => {10=>11, 5=>6, 7=>8})
    # hash_2.my_select                            # => {4=>4}
    def my_select(&prc)
      prc ||= Proc.new {|k,v| k == v}
      newHash = {}
      self.each do |k,v|
        newHash[k] = v if prc.call(k, v)
      end
      newHash
    end
end



class String
    # Write a method, String#substrings, that takes in a optional length argument
    # The method should return an array of the substrings that have the given length.
    # If no length is given, return all substrings.
    #
    # Examples:
    #
    # "cats".substrings     # => ["c", "ca", "cat", "cats", "a", "at", "ats", "t", "ts", "s"]
    # "cats".substrings(2)  # => ["ca", "at", "ts"]
    def substrings(length = nil) #wrong! :(
      array = []
      self.each_char.with_index do |let, i|
        self.each_char.with_index do |let2, i2|
          if !length
            array << self[i..i2] if i2 >= i
          else
            array << self[i..i2] if self[i..i2].length == length
          end
        end
      end
      array
    end

    def substring(length = nil )
      subs = []
      (0...self.length).each do |start_idx|
        (start_idx...self.length).each do |end_idx|
          sub = self[start_idx..end_idx]
          subs << sub
        end
      end
      if length.nil?
        subs
      else
        subs.select{|str| str.length == length}
    end



    # Write a method, String#caesar_cipher, that takes in an a number.
    # The method should return a new string where each char of the original string is shifted
    # the given number of times in the alphabet.
    #
    # Examples:
    #
    # "apple".caesar_cipher(1)    #=> "bqqmf"
    # "bootcamp".caesar_cipher(2) #=> "dqqvecor"
    # "zebra".caesar_cipher(4)    #=> "difve"
    def caesar_cipher(num)
      alphabet = ('a'..'z').to_a
      self.each_char.with_index do |let, i|
        idx = alphabet.index(let)
        self[i] = alphabet[(idx+num)%26]
      end
    end
end
