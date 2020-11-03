# load 'human_player.rb'
# player_1 = HumanPlayer.new(:X)
# player_1.mark
# player_1.get_position

class HumanPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        # not general yet
        p "Hello Player #{mark}, please enter row col position by typing 2 numbers with one space inbetween"

        valid_choice = false
        while !valid_choice 
            chosen_position = gets.chomp.split(" ").map(&:to_i) # => [0, 2]
            if legal_positions.include?(chosen_position)
                valid_choice = true
                return chosen_position
            else
                p "input not valid"
            end
        end
    end
end