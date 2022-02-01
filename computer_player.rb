#require_relative "game_multiplayer"

class ComputerPlayer

  attr_reader :name
  def initialize(name)
    @name = name
    #@current_word = Game.current_word
    #@dictionary = Game.dictionary
    @current_word = 'aa'
    @dictionary = ['alphabet', 'aardvark']
  end #end init

  def guess
    @dictionary.each do |word|
      if word.include?(@current_word)
        return word[@current_word.length]
      end#end if
    end#end each
  end#end guess

end#end

c = ComputerPlayer.new('1')
p c.guess
