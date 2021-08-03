require_relative "./board.rb"
require_relative "./card.rb"

class Game

    def initialize(prompt)
        Board.new(size)
        @guess = guess
    end

    def make_guess

    end
    
    def prompt
        p "Please enter the position of the card you'd like to flip (e.g., '2,3')"
        @guess = gets.chomp
    end

    def play
        until 
            @prompt
        end
    end

    def previously_guessed(pos)
        @previously_guessed = []
        @previously_guessed << [pos]
        #[[2,3] [4,5][9,2]]
    end

    def matches

    end
    
end