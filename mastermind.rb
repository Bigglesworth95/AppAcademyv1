require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code.random(length)
  end

  def print_matches(code_instance)
    puts "exact matches: #{code_instance.num_exact_matches(@secret_code)}"
    puts "near mathces: #{code_instance.num_near_matches(@secret_code)}"
  end

  def ask_user_for_guess
    puts 'Enter a code'
    guess = gets.chomp
    guess = Code.from_string(guess)
    print_matches(guess)
    guess == @secret_code
  end
end
