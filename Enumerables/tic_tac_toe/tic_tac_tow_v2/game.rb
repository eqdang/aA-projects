require "./board.rb"
require "./human_player.rb"

# V1
# load 'game.rb'
# game = Game.new(:X, :O)
# game.switch_turn
# game
# game.switch_turn
# game

# V2
# load 'game.rb'
# g = Game.new(4, 'A', 'B', 'C')
# g.switch_turn
# g.switch_turn
# game

class Game 
    def initialize(size, *player_marks)
        @players = []
        
        player_marks.each do |player|
            @players << HumanPlayer.new(player)
        end

        @current_player = @players[0]
        @board = Board.new(size)
    end

    def switch_turn
        # if @current_player == @players[0]
        #     @current_player = @player_2
        # else
        #     @current_player = @player_1
        # end
        @players.rotate!
        @current_player = @players[0]
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
