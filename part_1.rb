def my_map(arr, &prc)
  newArray = []
  arr.each {|ele| newArray << prc.call(ele)}
  newArray
end

def my_select(arr, &prc)
  newArray = []
  arr.each{|ele| newArray << ele if prc.call(ele)}
  newArray
end

def my_count(arr, &prc)
  count = 0
  arr.each {|ele| count+=1 if prc.call(ele)}
  count
end

def my_any?(arr, &prc)
  count = 0
  arr.each{|ele| count+=1 if prc.call(ele)}
  if count >0
    true
  else
    false
  end
end

def my_any(arr, &prc)
  arr.each do |ele|
    if prc.call(ele) == true
      return true
    end
  end
  false
end

def my_all?(arr, &prc)
  count = 0
  arr.each {|ele| count+=1 if prc.call(ele)}
  if count == arr.length
    true
  else
    false
  end
end

def my_all(arr,&prc)
  arr.each do |ele|
    if prc.call(ele) == false
      return false
    end
  end
  true
end

def my_none?(arr, &prc)
  count = 0
  arr.each{|ele| count+=1 if prc.call(ele)}
  if count == 0
    true
  else
    false
  end
end

def my_none(arr, &prc)
  arr.each do |ele|
    if prc.call(ele) == true
      return false
    end
  end
  true
end
