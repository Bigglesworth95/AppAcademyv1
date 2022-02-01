require 'byebug'
class Array
  def my_each (&prc)
    self.length.times do |num|
      prc.call(self[num])
    end#end times
    self
  end#end my each

  def my_select(&prc)
    newArr = []
    self.my_each do |i|
      newArr << i if prc.call(i)
    end#end each
    newArr
  end#end fx

  def my_reject(&prc)
    newArr = []
    self.my_each do |i|
      newArr << i unless prc.call(i)
    end#end each
    newArr
  end#end my_reject

  def my_any?(&prc)
    self.my_each {|i| return true if prc.call(i)}
    false
  end#end fx

  def my_all?(&prc)
    self.my_each {|i| return false if !prc.call(i)}
    true
  end#end fx

  def my_flatten(&prc)
    newArr = []
    #debugger
    self.my_each do |i|
      if i.is_a?(Array)
        newArr.concat(i.my_flatten)
      else
        newArr << i
      end#end if
    end#end each
    newArr
  end#end fx

  def my_zip(*arrs)
    zipper = []
    (0...self.length).each do |idx|
      tempArr = []
      tempArr << self[idx]
      arrs.my_each do |arr|
        tempArr << arr[idx]
      end#end arr each
      zipper << tempArr
    end#end idx each
    zipper
  end#end my zip

  def my_rotate(times = 1)
    if times > 0
      (0...times).each do |i|
        first = self.shift
        self << first
      end#end each
    elsif times < 0
      times = times*-1
      (0...times).each do |i|
        last = self.pop
        self.unshift(last)
      end#end each
    end#end if
    self
  end

  def my_join(sep="")
    str = ""
    (0...self.length).each do |idx|
      el = self[idx].to_s
      str+=el
      if sep && self[idx+1]
        str+=sep
      end#end if
    end#end each
    str
  end#end join

  def my_reverse
    newArr = []
    self.my_each {|i| newArr.unshift(i)}
    newArr
  end#end my_reverse

  def bubble_sort!(&prc)
    if self == []
      return []
    end#end empty check
    changed = false
    while !changed
      changed = true
      (0...self.length-1).each do |i|
        if prc
          #debugger
          if prc.call(self[i], self[i+1]) == 1 || prc.call(self[i], self[i+1]) == false
            self[i], self[i+1] = self[i+1], self[i]
            changed = false
          end#end nested if
        else
          if self[i] > self[i+1]
            self[i+1], self[i] = self[i], self[i+1]
            changed = false
          end#end nested if
        end #end outer if
      end #end each loop
    end #end while loop
    self
  end#end bubble sort

  def bubble_sort(&prc)
    arr = self.dup
    arr = arr.bubble_sort!
    arr
  end

  def my_map(&prc)
    mao = []
    self.each {|el| mao << prc.call(el)}
    mao
  end

  def my_inject(&prc)
    acc = self[0]
    (1...self.length).each do |i|
      acc = prc.call(acc, self[i])
    end
    acc
  end#end inject
end#end array class


#------------------------------------------------------------------------------
#------------------------------------------------------------------------------
#------------------------------------------------------------------------------


def factors(num)
  factor_list = []
  (1..num).each do |i|
    factor_list << i if num%i == 0
  end
  factor_list
end

def subwords(word, words)
  subwords = []
  words.each do |i|
    subwords << i if word.include?(i)
  end#each
  subwords
end#end fx

def doubler (arr)
  newArr = []
  arr.each {|i| newArr << i*2}
  newArr
end

def concatenate(arr)
  newStr = arr.inject {|s1, s2| s1 = s1 + s2 }
  newStr
end#end concat





#p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
#p [ 1 ].my_reverse               #=> [1]

#a = [ "a", "b", "c", "d" ]

#p a.my_join         # => "abcd"
#p a.my_join("$")    # => "a$b$c$d"


#p a.my_rotate         #=> ["b", "c", "d", "a"]
#p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
#p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
#p a.my_rotate(15)     #=> ["d", "a", "b", "c"]


#a = [ 4, 5, 6 ]
#b = [ 7, 8, 9 ]
#[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
#p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
#p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

#c = [10, 11, 12]
#d = [13, 14, 15]
#p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]
#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]



#val = [1,2,3].my_each do |i|
#  puts i
#end.my_each do |i|
#  puts i
#end
#p val

#val = [1,2,3]
#p val.my_select {|num| num > 1}
#p val.my_select {|num| num == 4}

#p val.my_reject {|num| num > 1}
#p val.my_reject {|num| num == 4}

#a  = [1,2,3]
#p a.my_any? { |num| num > 1 } # => true
#p a.my_any? { |num| num == 4 } # => false
#p a.my_all? { |num| num > 1 } # => false
#p a.my_all? { |num| num < 4 } # => true
