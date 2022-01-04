def select_even_nums(arr)
arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject {|hash| hash['age']<=2}
end

def count_positive_subarrays(arr)
  arr.count {|subarr| subarr.sum>0}
end

def aba_translate(word)
  vowels = 'aeiouAEIOU'
  newWord = ""
  word.each_char do |let|
    if vowels.include?(let)
      newWord += let+'b'+let
    else
      newWord +=let
    end
  end
  newWord
end

def aba_array(arr)
  arr.map {|word| aba_translate(word)}
end

puts aba_array(["cat", "dog", "butterfly"])
