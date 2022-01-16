#Write a method some? that accepts an array and a block as arguments.
#The method should return a boolean indicating whether or not at least one of the elements of the array returns true when given to the block. Solve this using Array#each.

def some?(arr, &prc)
  arr.each {|i| return true if prc.call(i)}
  false
end

#Write a method exactly? that accepts an array, a number (n), and a block as arguments.
#The method should return a boolean indicating whether or not there are exactly n elements that return
#true when given to the block.
#Solve this using Array#each.

def exactly?(arr, n, &prc)
  count = 0
  arr.each {|i| count+=1 if prc.call(i)}
  count == n
end

#Write a method filter_out that accepts an array and a block as arguments.
#The method should return a new array where elements of the original array are removed
#if they return true when given to the block. Solve this using Array#each.

def filter_out(arr, &prc)
  newArr = []
  arr.each {|i| newArray << i if prc.call(i)==false}
  newArr
end

#Write a method at_least? that accepts an array, a number (n), and a block as an arguments.
#The method should return a boolean indicating whether or not at least n elements of the array
#return true when given to the block. Solve this using Array#each.

def at_least?(arr, n, &prc)
  count = 0
  arr.each {|i| count+=1 if prc.call(i) == true}
  count >= n
end

#Write a method every? that accepts an array and a block as arguments.
#The method should return a boolean indicating whether or not all elements of the array
#return true when given to the block. Solve this using Array#each.

def every?(arr, &prc)
  arr.each do |i|
     if !prc.call(i)
       return false
     end
   end
   true
end

#Write a method at_most? that accepts an array, a number (n), and a block as arguments.
#The method should return a boolean indicating whether no more than n elements of the array return true
#when given to the block. Solve this using Array#each.

def at_most?(arr, n, &prc)
  count = 0
  arr.each {|i| count+=1 if prc.call(i) == true}
  count <= n
end
#Write a method first_index that accepts an array and a block as arguments.
#The method should return the index of the first element of the array that returns true when given to
#the block. If no element of returns true, then the method should return nil. Solve this using Array#each.

def first_index(arr, &prc)
  arr.each_with_index do |n, i|
    if prc.call(n) == true
      return i
    end
  end
  nil
end

def first_indexer(arr, &prc)
  arr.each_with_index do |n,i|
    return i if prc.call(n)
  end
  nil
end
#Write a method xnor_select that accepts an array and two procs as arguments.
#The method should return a new array containing elements of the original array that either
#return true for both procs or return false for both procs.

def xnor_select(arr, prc1, prc2)
  newArr = []
  arr.each do |i|
    newArr << i if (prc1.call(i) && prc2.call(i) || !prc1.call(i) && !prc2.call(i))
  end
  newArr
end

def xnor__select(arr, prc1, prc2)
  newArr = []
  arr.each do |i|
    newArr << i if prc1.call(i) == prc2.call(i)
  end
  newArr
end
#Rewrite your previous filter_out method to mutate the input array instead of returning a new array.
#That is, write a method filter_out! that accepts an array and a block as args.
#The method should remove elements of the input array that return true when given to the block.
#Solve this without using Array.reject!.

def filter_out!(arr, &prc)
  delete = true
  while delete == true
    delete = false
    arr.each_with_index do |n,i|
      if prc.call(n) == true
        arr.delete_at(i)
        delete = true
        break
      end
    end
  end
end

def filterr_out!(array, &prc)
  array.uniq.each {|el| array.delete(el) if prc.call(el)}
end


#Write a method multi_map that accepts an array, an optional number (n), and a block as arguments.
#The method should return a new array where each element of the original array is repeatedly run through the block n times.
#If the number argument is not passed in, then the the elements should be run through the block once.

def multi_map(arr, n=1, &prc)
  n.times do
    arr = arr.map {|i| prc.call(i)}
  end
  arr
end

#Write a method proctition that accepts an array and a block as arguments.
#The method should return a new array where the elements that return true
#when given to the block come before all of the elements that return false when given to the block.
#This means that the new array has two partitions; the order among elements \
#in the same partition should be the same as their relative order in the input array.

def proctition(arr, &prc)
  trueArr = []
  falseArr = []
  arr.each do |i|
    if prc.call(i)
      trueArr << i
    else
      falseArr << i
    end
  end
  trueArr + falseArr
end

#Write a method selected_map! that accepts an array and two procs as arguments.
#The method should replace the elements that return true when passed into the first proc with their return values when they are passed into the second proc.
#This method should mutate the input array and return nil.

def selected_map!(arr, prc1, prc2)
  arr.each_with_index do |el, i|
    arr[i] = prc2.call(el) if prc1.call(el)
  end
  return nil
end

#Write a method that accepts any value and an array of procs as an argument.
#The method should return the final result of feeding
#the value through all of the procs.
# For example, if the array contains three procs, then:

#the value is given to the first proc
#the result of the first proc is given to the second proc
#the result of the second proc is given to the third proc
#the result of third proc is the final result

def chain_map(n, arr)
  arr.each do |prc|
    n = prc.call(n)
  end
  n
end

def chain_mapp(n,arr)
  arr.inject(n) {|accum, prc| prc.call(accum)}
end

#Write a method proc_suffix that accepts a sentence and a hash as arguments.
#The hash contains procs as keys and suffix strings as values.
#The method should return a new sentence where each word of the original sentence is appended with a suffix
#if the original word returns true when given to the corresponding proc key.
#If an original word returns true for multiple procs, then the suffixes should be appended in the order that they appear in the input hash.

def proc_suffix(sent, hash)
  sent = sent.split(" ")
  sent.each_with_index do |word,i|
    hash.each do |k,v|
      if k.call(word)
        sent[i] = sent[i]+v
      end
    end
  end
  sent.join(" ")
end

#Write a method proctition_platinum that accepts an array and any number of additional procs as arguments.
#The method should return a hash where the keys correspond to the number of procs passed in.

#For example, if three procs are passed in, then the hash should have the keys 1, 2, and 3.
#The values associated with each key should be an array
#containing the elements of the input array that return true when passed into the corresponding proc.

#For example, this means that the array that corresponds to the key 2 should contain the elements that return true when passed into the second proc.
#If an element returns true for multiple procs, then
#it should only be placed into the array that corresponds to the proc that appears first in the arguments.

def proctition_platinum1(arr, *prcs)
  procArray = []
  prcs.each {|prc| procArray << prc}
  hash = Hash.new {|h,k| h[k] = []}
  shoveled = []
  procArray.each_with_index do |prc, i|
    arr.each_with_index do |el, idx|
      if prc.call(el) && !shoveled.include?(el)
        shoveled << el
        hash[i+1] << el
      else
        hash[i+1]
      end
    end
  end
  hash
end

def proctition_platinum(array, *prcs)
  partition = {}
  prcs.each_index {|i| partition[i+1]=[]}
  array.each do |el|
    p ['here', el, partition]
    prcs.each_with_index do |prc,i|
      if prc.call(el)
        partition[i+1] << el
        break
      end
    end
  end
  partition
end

#Write a method procipher that accepts a sentence and a hash as arguments.
#The hash contains procs as both keys and values.
#The method should return a new sentence where each word of the input sentence is changed by a value proc if
#the original word returns true when passed into the key proc.
#If an original word returns true for multiple key procs,
#then the value proc changes should be applied in the order that they appear in the hash.

def procipher(sent, hash)
  keys = hash.keys
  sent = sent.split(" ")
  newSent = []
  sent.each_with_index do |word,i|
    keys.each do |key|
      if key.call(sent[i])
         word = hash[key].call(word)
       end
     end
     newSent<< word
   end
   newSent.join(" ")
end

def pro_cipher(sentence, cipher)
  words = sentence.split(" ")
  new_words = words.map do |word|
    new_word = word
    cipher.each do |checker, changer|
      new_word = changer.call(new_word) if checker.call(word)
    end
    new_word
  end
  new_words.join(" ")
end

#Write a method picky_procipher that accepts a sentence and a hash as arguments.
#The hash contains procs as both keys and values. \
#The method should return a new sentence where each word of the input
#sentence is changed by a value proc if the original word returns true
#when passed into the key proc. If an original word returns true for multiple key procs,
#then only the value proc that appears earliest in the hash should be applied.

def procker(word, hash)
  keys = hash.keys
  values = hash.values
  keys.each_with_index do |prc,i|
    if prc.call(word)
      #p [word, prc.call(word), values[i].call(word)]
      return values[i].call(word)
    end
  end
  word
end

def picky_procipher(sent, hash)
  sent = sent.split(" ")
  newSent = []
  sent.each do |word|
    newSent << procker(word, hash)
  end
  newSent.join(" ")
end

def picky__procipher(sentence, cipher)
  words = sentence.split(" ")
  new_words = words.map do |word|
    key_procs = cipher.keys
    matches = key_procs.select {|prc| prc.call(word)}
    if matches.length > 0
      key_proc = matches.first
      value_proc = cipher[key_proc]
      value_proc.call(word)
    else
      word
    end
  end
  new_words.join(' ')
end
