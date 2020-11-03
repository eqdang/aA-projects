require "./board.rb"
require "./human_player.rb"

# load 'game.rb'
# game = Game.new(:X, :O)
# game.switch_turn
# game
# game.switch_turn
# game

class Game 
    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)

        @current_player = @player_1 
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        until @board.empty_positions? == false
            @board.print
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)
             if @board.win?(@current_player.mark)
                p "victory"
                return
             else
                game.switch_turn
             end 
            end
        end

end
