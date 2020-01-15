# require_relative "board.rb"
require_relative "piece.rb"
 
# bishop/rook/queen

module Slideable #module can call any instance in the method
    def horizontal_dirs
        [[0, -1], [-1, 0]]
    end

    def diagonal_dirs
        [[-1, -1], [1, 1], [1, -1], [-1, 1]]
    end
    
    def vertical_dirs
        [[1, 0], [0, 1]]
    end

    def moves
        possible_moves = self.grow_unblocked_moves_in_dir(pos)

        @possible_moves.each do |move|


        end
    
    end

    private

    def move_dirs #global varibles
        #top right? top left? bottom right? bottom left?
        row,col = self.pos 
        if self.pos[row-1, col].empty? #can it move up? if empty, create a possible position
            true
        elsif self.pos[row+1, col].empty? #can it move down?
            true
        elsif self.pos[row, col+1].empty? #can it move right?
            true
        elsif self.pos[row, col-1].empty? #can it move left?
            true
        end
        false 
    end

    def grow_unblocked_moves_in_dir(dx,dy) #helper method for moves
        moves = []
        
        if @board.empty?(pos)
            row, col = pos
            new_pos = [row+dx, col+dy]
            new_pos << moves 
            #new_pos[x+dx, y+dy]
            # return new pos (x, y])
        end
        moves 
    end
end

class Bishop < Piece
    include Slideable

    # attr_reader :symbol
    def inititalize(color, board, pos)
        super
    end

    def symbol
        color == :white ? "♗" : "♝"
    end

    def move_dirs
       self.diagognal_dirs
        # [[-1, -1], [1, 1], [1, -1], [-1, 1]] 
    end

end

class Rook < Piece
    include Slideable
    # attr_reader :symbol

    def inititalize(color, board, pos)
        super
    end

    def symbol
        color == :white ? "♖" : "♜"
    end

    def move_dirs
        self.horizontal_dirs + self.vertical_dirs

    end

end

class Queen < Piece 
    include Slideable
    # attr_reader :symbol

    def inititalize(color, board, position)
        super
    end

    def symbol
        color == :white ? "♕" : "♛"
    end

    def move_dirs
        self.horizontal_dirs + self.vertical_dirs + self.diagonal_dirs
    end

end
