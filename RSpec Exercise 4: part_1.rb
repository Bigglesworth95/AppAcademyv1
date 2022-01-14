def my_reject(arr, &prc)
  arr.select {|i| i if prc.call(i) == false}
end

def my_one?(arr, &prc)
  count = 0
  arr.each {|i| count+=1 if prc.call(i)}
  if count == 1
    true
  else
    false
  end
end

def hash_select(hash, &prc)
  newHash = {}
  hash.each {|k,v| newHash[k] = v if prc.call(k,v)}
  newHash
end

def xor_select(arr, prc1, prc2)
  newArr = []
  bothArr = []
  arr.each do |i|
    bothArr << i if prc1.call(i) && prc2.call(i)
    newArr << i if prc1.call(i) || prc2.call(i)
  end
  newArr -= bothArr
  newArr
end

def proc_count(val, arr)
  count = 0
  arr.each {|i| count+=1 if i.call(val)}
  count
end
