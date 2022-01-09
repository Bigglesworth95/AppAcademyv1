class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  def self.valid_pegs?(arr)
    arr = arr.map(&:upcase)
    arr.each do |ele|
      if !POSSIBLE_PEGS.has_key?(ele)
        return false
      end
    end
    true
  end

  attr_reader :pegs

  def initialize(arr)
    if !Code.valid_pegs?(arr)
      raise 'error'
    end
    @pegs = arr.map(&:upcase)
  end

  def self.random(length)
    Code.new(Array.new(length, POSSIBLE_PEGS.keys.sample))
  end

  def self.from_string(string)
    string = Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    num = 0
    @pegs.each_with_index do |peg, idx|
      if peg == code[idx]
        num+=1
      end
    end
    num
  end

  def num_near_matches(guess)
    num = 0
    codeHash = Hash.new(0)
    @pegs.each {|i| codeHash[i] +=1}
    guess.pegs.each do |peg|
      if codeHash.has_key?(peg) && codeHash[peg] > 0
        num+=1
        codeHash[peg] -=1
      end
    end
    num - num_exact_matches(guess)
  end

  def  == (code)
    code.pegs == @pegs
  end

end



#p num_near_matches(arr)
