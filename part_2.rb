def all_words_capitalized?(arr)
  arr.all? {|word| word == word.capitalize}
end

def no_valid_url?(arr)
  ends = ['.com','.net', '.io','.org' ]
  arr.none? do |url|
    ends.any? {|ending| url.end_with?(ending)}
  end
end

def average(arr)
  arr.sum/arr.length
end

def any_passing_students?(arr)
  arr.any? {|student| average(student[:grades])>=75}
end
