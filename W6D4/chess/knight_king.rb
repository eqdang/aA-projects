require_relative "piece.rb"

module Stepable 
    #Knight/King

    def moves
    end

    private
    def move_diffs

        
    end
 
end

class Knight < Piece
    include Stepable 
#    attr_reader :symbol

    def initialize(color,board,pos)
        super
    end

    def symbol
        color == :white ? "♘" : "♞"
    end

    protected
    
    def move_diffs #knights
        [[-2, -1],
        [-2,  1],
        [-1, -2],
        [-1,  2],
        [ 1, -2],
        [ 1,  2],
        [ 2, -1],
        [ 2,  1]]
    end
end

  

class King < Piece
    include Stepable
    # attr_reader :symbol

    def initialize(color,board,pos)
        super
    end

    def symbol
        color == :white ? "♔" : "♚"
    end
    
    protected
    
    def move_diffs
        [[1, 0], [0, 1], [0, -1], [-1, 0],
        [-1, -1], [1, 1], [1, -1], [-1, 1]]
    end
end