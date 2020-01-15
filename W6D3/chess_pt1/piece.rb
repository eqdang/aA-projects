# require_relative "bishop_rook_queen.rb"
# require_relative "pawn.rb"
# require_relative "knight_king.rb"
# require_relative "null_pieces.rb"

class Piece 

    attr_accessor :color,:board, :pos

    def inititalize(color,board,pos)
        @color = color 
        # @symbol = symbol 
        @board = board
        @pos = pos   

        board.add_piece(self, pos)
    end
    
    def symbol
        # raise NotImplementedError
    end

    def to_s #check symbol?

        " #{symbol}"
        # if @sybmol == "♗" || @symbol == "♝"
             
        # elsif @symbol == "♖" || @symbol == "♜"
        
        # elsif @symbol == "♕"  || @symbol == "♛"
            
        # elsif @symbol == "♘" || @symbol == "♞"

        # elsif @symbol == "♔" || @symbol == "♚"

        # elsif @symbol == "♙" || @symbol == "♟" 
        
        # end

    end

    def empty?
        if self[pos].empty?
            return true
        end
       false  
    end

    def valid_moves

    
    end

    def pos=(val)
        row, col = val 
    end

    private

    def move_into_check?(end_pos)

    end
    
end


