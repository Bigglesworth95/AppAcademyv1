# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length == 0
      return nil
    end
    self.max - self.min
  end

  def average
    if self.length == 0
      return nil
    end
    self.sum.to_f/self.length.to_f
    #self.sum/(self.length*1.0)
  end

  def median
    arr = self.sort
    if self.length == 0
      return nil
    elsif arr.length % 2 == 1 #self.length.odd?
      arr[arr.length/2]
    else
      (arr[arr.length/2] + arr[arr.length/2-1])/2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each {|i| hash[i]+=1}
    hash
  end

  def my_count(value)
    count = 0
    self.each {|i| count+=1 if i == value}
    count
  end

  def my_index(value)
    self.each_with_index do |n,i|
      if n == value
        return i
      end
    end
    nil
  end

  def my_uniq
    newArr = []
    self.each {|i| newArr<< i if !newArr.include?(i)}
    newArr
  end

  def uniqq
    hash = {}
    self.each{|ele| hash{ele} = true}
    hash.keys
  end

  def my_transpose
    newArr = []
    (0...self.length).each do |it|
      tempArr = []
      self.each_with_index do |arr,idx|
        arr.each_with_index do |n,i|
          tempArr << n if i == it
        end
      end
      newArr << tempArr
    end
    newArr
  end

  def transpose_again
    newArr = []
    (0...self.length).each do |row|
      newRow = []
      (0...self.length).each do |col|
        newRow << self[row][col]
      end
      newArr << newRow
    end
end
