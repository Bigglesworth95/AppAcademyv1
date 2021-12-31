#This sheet was empty. The task was to run rspec, read the errors, and then devise this sheet based on the error output. 
def average(num1, num2)
  (num1.to_f+num2.to_f)/2.0
end

def average_array(arr)
  arr.sum.to_f/arr.length.to_f
end

def repeat(str, num)
  str*num
end

def yell(str)
  str = str.upcase!
  str+"!"
end


def alternating_case(str)
  str = str.split(" ")
  str.each_with_index do |let, i|
    if i == 0
      str[i].upcase!
    else
      if i %2 == 0
        str[i].upcase!
      else
        str[i].downcase!
      end
    end
  end
  str.join(" ")
end
