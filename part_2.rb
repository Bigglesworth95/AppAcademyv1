def reverser(str, &prc)
  str = str.reverse
  str = prc.call(str)
end

def reverserr(str, &prc)
  prc.call(str.reverse)
end

def word_changer(str, &prc)
  sent = str.split(" ")
  sent = sent.map {|word| prc.call(word)}
  sent = sent.join(" ")
end

def greater_proc_value (num, prc1, prc2)
  num1 = prc1.call(num)
  num2 = prc2.call(num)
  if num1>num2
    num1
  else
    num2
  end
end

def and_selector(arr, prc1, prc2)
  newArray = []
  arr.each {|ele| newArray << ele if prc1.call(ele) && prc2.call(ele)}
  newArray
end

def alternating_mapper(arr, prc1, prc2)
  newArray = []
  i = 2
  arr.each do |ele|
    if i %2 == 0
      newArray << prc1.call(ele)
    else
      newArray << prc2.call(ele)
    end
    i+=1
  end
  newArray
end

def alternatingMapper(arr, prc1, prc2)
  mapped = []
  array.each_with_index do |el, idx|
    if idx.even?
      mapped << prc1.call(el)
    else
      mapped << prc2.call(el)
    end
  end
  mapped
end
