require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play

  end

  def take_turn
    show_sequence
    require_sequence
    if !@game_over
      round_success_message
      @sequence_length +=1
      take_turn
    else
      game_over_message
      reset_game
    end
  end

  def show_sequence
    add_random_color
    p @seq
  end

  def require_sequence
    p 'enter input seperated by a space'
    sequence = gets.chomp.split(' ')
    if sequence != @seq
      @game_over = true
    end
  end

  def add_random_color
    color = COLORS.sample
    @seq << color
  end

  def round_success_message

  end

  def game_over_message
    @game_over = true
    p 'you lose'
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
s = Simon.new
s.take_turn
