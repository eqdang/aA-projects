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

# marks_hash key = marks, values = booleans
# marks_hash = {X: false, Y: true, Z: false}
# @players (hash) key = mark, value = computerplayer|humanplayer
# Game.new(4, )
class Game 
    def initialize(size, marks_hash)
        @players = {}
        marks_hash.each do |mark, is_pc|
            if is_pc
                # make a computer player
                @players[mark] = ComputerPlayer.new(mark)
            else
                @players[mark] = HumanPlayer.new(mark)
            end
        end

        first_player_symbol = @players.keys[0]
        @current_player = @players[first_player_symbol]
        @board = Board.new(size)

    end

    def switch_turn
        # if @current_player == @players[0]
        #     @current_player = @player_2
        # else
        #     @current_player = @player_1
        # end
        @players.keys.rotate!
        next_player_symbol = @players.keys[0]
        @current_player =  @players[next_player_symbol]
    end

    def play
        until @board.empty_positions? == false
            @board.print
            position = @current_player.get_position(@board.legal_positions)
            @board.place_mark(position, @current_player.mark)
             if @board.win?(@current_player.mark)
                p "victory"
                return
             else
                self.switch_turn
             end 
            end
        end

end
