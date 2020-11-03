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

    def get_position
        p "Hello Player #{mark}, please enter row col position by typing 2 numbers with one space inbetween. choose numbers between 0 and 2 only. for example: 2 0 "
        
        input = gets.chomp
            return position = input.split.map(&:to_i)

        raise "input not valid" if position.length != 2
    end
end