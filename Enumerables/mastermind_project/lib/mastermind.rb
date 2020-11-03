require_relative "code"

class Mastermind

# PART 3

    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(guess)
        puts "#{@secret_code.num_exact_matches(guess)}"
        puts "#{@secret_code.num_near_matches(guess)}"
    end

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        Code.from_string(input)
        puts "#{@secret_code.num_exact_matches(input)}"
        puts "#{@secret_code.num_near_matches(input)}"
        @secret_code.==(input)
    end

end
