require_relative "players.rb"
require 'byebug'
class Game
  attr_reader :current_player, :previous_player, :losses, :player_list, :current_word, :dictionary
  def initialize(*players)
    @player_list = []
    players.each do |player|
      @player_list << Player.new(player)} if player != 'Computer'
      @player_list << ComputerPlayer.new(player) if player == 'Computer'
    end#end each
    @lines = File.readlines("dictionary.txt").map{|line| line.gsub(/\n$/,"")}
    @dictionary = {}
    @lines.each  {|line| @dictionary[line] = 1}
    @current_player = @player_list[0]
    @current_word = ""
    @losses = Hash.new {|h,k| h[k] = 0}
    @previous_player = @player_list[-1]
  end#end init


  def next_player!
    @previous_player = @current_player
    @player_list.rotate!
    if @losses[player_list[0]] == 5
      next_player!
    end#end if
    @current_player = @player_list[0]
  end#end next player



  def valid_play?(string)
    @dictionary.keys.any? {|key| return true if key.include?(string) && key.length != string.length}
    false
  end#end valid p

  def record(player)
    str = 'GHOST'
    @losses.keys.each do |player|
      p "#{player.name} has #{str[0...@losses[player]]}"
    end
  end#end record

  def loser?(player)
    if @losses[player] == 5
      p "#{player.name}, you lose the game! Goodbye."
      @player_list.delete_at(0)
    end#end if
  end#end loser?

  def winner?
    if @player_list.length == 1
      return true
    end#end if
    false
  end#end winner?

  def take_turn(player)
    p "#{@current_player.name}, its your turn"
    @current_word += player.guess
    if !valid_play?(@current_word)
      p 'you lose that round'
      @current_word = ''
      @losses[player] +=1
      record(player)
      loser?(player)
      next_player!
      if winner?
        p "#{@current_player.name}, you win the game!"
        return
      end
      take_turn(@current_player)
    else
      next_player!
      take_turn(@current_player)
    end#end if
  end#end fx

  def run
    p "hi everyone. The game today features these players: #{player_list}"
    take_turn(@current_player)
  end#end run




end#end class

g = Game.new('DDD', 'MMM')
p g.player_list
g.run
