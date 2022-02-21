require 'set'
require 'byebug'
class WordChainer
  attr_reader :dictionary, :all_seen_words
  def initialize
    @dictionary = Set.new File.readlines("dictionary.txt").map(&:chomp)
    @current_words = []
    @all_seen_words = {}
  end

  def word_sub(w1, w2)
    newWord = ""
    w1.each_char do |let|
      if !w2.include?(let)
        newWord += let
      end
    end
    newWord
  end

  def adj_checker(w1, w2)
    f_count = 0
    w1.each_char.with_index do |let, i|
      if let != w2[i]
        f_count +=1
        return false if f_count >1
      end
    end
    true
  end


  def adjacent_words(target)
    adj_words =[]
    @dictionary.each do |word|
      if target.length == word.length && word_sub(target, word).length == 1
        adj_words << word if adj_checker(target, word)
      end
    end
    adj_words
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        if !@all_seen_words.keys.include?(adjacent_word)
          new_current_words << adjacent_word
          @all_seen_words[adjacent_word] = current_word
        end #end if
      end #end adjacent words.each
    end#end current_words.each
    new_current_words.each do |word|
      p [word, @all_seen_words[word]]
    end
  end

  def build_path(target)
    path = [target]
    while true
      return path if @all_seen_words[target] == nil
      path.unshift(@all_seen_words[target])
      target = @all_seen_words[target]
    end
    path
  end

  def run(source, target)
    @current_words << source
    @all_seen_words[source] = nil
    while !@current_words.empty?
      new_current_words = explore_current_words
      @current_words = new_current_words
      break if @all_seen_words.include?(target)
    end #end while loop
  end


end

w = WordChainer.new()
w.run('market', 'garter')
p w.build_path("garter")
