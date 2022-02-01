require_relative "players.rb"
require 'byebug'
class Game
  attr_reader :current_player, :previous_player, :losses
  def initialize(p1, p2)
    @player1 = Player.new(p1)
    @player2 = Player.new(p2)
    @lines = File.readlines("dictionary.txt").map{|line| line.gsub(/\n$/,"")}
    @hash = {}
    @lines.each  {|line| @hash[line] = 1}
    @current_player = @player1
    @current_word = ""
    @losses = Hash.new {|h,k| h[k] = 0}
  end#end init

  def next_player!
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end#end if
  end#end next player

    def previous_player
      if @current_player == @player1
        return @player2
      else
        return @player1
      end#end previous player
    end#end fx

    def take_turn(player)
      p "#{@current_player.name}, its your turn"
      @current_word += player.guess
      if !valid_play?(@current_word)
        p 'you lose that round'
        @current_word = ''
        @losses[player] +=1
        record(player)
      else
        next_player!
        take_turn(@current_player)
      end#end if
    end#end fx

    def valid_play?(string)
      @hash.keys.any? {|key| return true if key.include?(string) && key.length != string.length}
      false
    end#end valid p

    def record(player)
      str = 'GHOST'
      val = @losses[player]
      rec = str[0...val]
      #p "#{player} has a #{str[0...val]}"
      display_standings
      if str == rec
        p "#{player.name}, you lose the game!"
      else
        next_player!
        take_turn(@current_player)
      end#end if
    end#end record

    def run
      take_turn(@current_player)
    end#end run

    def display_standings
      str = 'GHOST'
      @losses.keys.each do |player|
        p "#{player.name} has #{str[0...@losses[player]]}"
      end
    end


end#end class

g = Game.new('me', 'you')
g.run
