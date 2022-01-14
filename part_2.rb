def element_count(arr)
  hash = Hash.new(0)
  arr.each {|i| hash[i]+=1}
  hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |let, i|
    str[i] = hash[let] if hash.has_key?(let)
  end
  str
end

def product_inject(arr)
  arr.inject {|prod, n| prod*n}
end
