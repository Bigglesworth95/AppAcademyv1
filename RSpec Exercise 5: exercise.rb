def zip(*arr)
  lengths = []
  arr.each do |i|
    lengths << i.length
  end
  if !lengths.all?(lengths[0])
    return false
  end

  newArr = []
  count = 0
  while newArr.length != lengths[0]
    tArray = []
    arr.each do |i|
      tArray << i[count]
    end
    newArr << tArray
    count+=1
  end
  newArr
end

def prizz_proc(arr, prc1, prc2)
  newArr = []
  arr.each {|i| newArr << i if (prc1.call(i) || prc2.call(i)) && !(prc1.call(i) && prc2.call(i))}
  newArr
end

def zany_zip(*arr)
  lengths = []
  arr.each do |i|
    lengths << i.length
  end

  max = lengths.max

  newArr = []
  count = 0
  while newArr.length != max
    tArray = []
    arr.each do |i|
      tArray << i[count]
    end
    newArr << tArray
    count+=1
  end
  newArr
end

def maximum(arr, &prc)
  if arr.length ==0
    return nil
  end
  max = -(Float::INFINITY)
  maxPrc = -(Float::INFINITY)
  arr.each do |i|
    test = prc.call(i)
    if test >= maxPrc
      maxPrc = test
      max = i
    end
  end
  max
end
arr = [2, 4, -5, 1]

def my_group_by(arr, &prc)
  newHash = Hash.new {|h,k| h[k] = []}
  arr.each {|i| newHash[prc.call(i)] << i}
  newHash
end


def max_tie_breaker(arr, prc, &blc)
  if arr.length == 0
    return nil
  end
  max = ""
  blcMax = -(Float::INFINITY)
  arr.each do |i|
    blockTest = blc.call(i)
    procTest = prc.call(i)
    currentMaxProc = prc.call(max)

    if blockTest > blcMax #test1: geatest block value
      blcMax = blockTest
      max = i

    elsif blockTest == blcMax #test 2: greatest proc
      if procTest > currentMaxProc
        p [' max: ', max, " i: ", i, " maxPrc: ", currentMaxProc, " prcTest: ", procTest]
        max = i
        blcMax = blockTest
      end
    end
  end
  max
end


def silly_syllables(sent)
  vowels = 'aeiou'
  words = sent.split(" ")
  newWords = []
  words.each do |word|
    vowel_box = []
    word.each_char.with_index do |let, i|
      vowel_box << i if vowels.include?(let)
    end
    if vowel_box.length >= 2
      newWords << word[vowel_box[0]..vowel_box[-1]]
    else
      newWords << word
    end
  end
  newWords.join(" ")
end
