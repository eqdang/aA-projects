require_relative "piece.rb"

class Pawn #< Piece

    def initialize(color, board, pos) #color = :white, :black
        super
    end

    def symbol
        color == :white ? "♙" : "♟"
    end

    def self.valid_moves(pos)
        row, col = pos
        return false if row < 0 || row > 7 || col < 0 || col > 7
        true
    end

    DIRECTIONS = [[-1,0],[-2,0]] 

    def move_dirs
        []
    end

    private

    def at_start_row?
        row, col = pos
        if row == 1 || row == 6
            return true
        end
        false 
        # @board[1] 
        # @board[6] 
    end

    def forward_dir #returns 1 or -1
        #side or stright?

    end

    def forward_steps


    end

    def side_attacks
        #side attacks go [-1,1]
        #replace existing piece with the pawn 
    end

end