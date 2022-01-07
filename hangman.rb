class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      true
    else
      false
    end
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |let, i|
      if let == char
        arr << i
      end
    end
    arr
  end

  def fill_indices(char, arr)
    arr.each {|i| @guess_word[i]=char}
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      if !@secret_word.include?(char)
        @remaining_incorrect_guesses -=1
      else
        fill_indices(char, self.get_matching_indices(char))
      end
      return true
    end
  end

  def better_try_guess(char)
    if self.already_attempted(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char

    matches = self.get_matching_indices(char)
    self.fill_indices(char, matches)

    @remaining_incorrect_guesses -=1 if matches.empty?
    true
  end

  def ask_user_for_guess
    puts 'Enter a char:'
    guess = gets.chomp
    result = try_guess(guess)
    result
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts 'WIN'
      return true
    else
      return false
    end
  end
  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      false
    end
  end

  def game_over?
    if win? == true || lose? == true
      puts @secret_word
      true
    else
      false
    end
  end
end
