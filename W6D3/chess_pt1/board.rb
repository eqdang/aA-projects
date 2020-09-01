
require_relative "bishop_rook_queen.rb"
require_relative "knight_king.rb"
require_relative "null_pieces.rb"
require_relative "pawn.rb"
require_relative "piece.rb"

class Board 
    attr_reader :rows, :sentinel 

    def initialize(fill_board=true) #NullPiece
        @sentinel = NullPieces.instance
         
        populate(fill_board)

        
    end

    def populate(fill_board)
   
        @rows = Array.new(8) {Array.new(8, sentinel)}
        
        back_row = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]

        # color,symbol,board,pos
        back_row.each_with_index do |piece_class, idx|
            @rows[7][idx] = piece_class.new(:B, self, [7, idx]) 
            @rows[0][idx] = piece_class.new(:W, self, [0, idx])
        end
        
        @rows[6][idx] = Pawn.new(:B, self, [6, idx])
        @rows[1][idx] = Pawn.new(:W, self, [1, idx])
    end

    def move_piece(start_pos, end_pos)


    end

    def [](pos)
        row,col = pos
        self[row][col]
    end

    def []=(pos, symbol)
        row,col = pos
        self[row][col] = symbol
    end

    def move_piece(color, start_pos, end_pos)

    end

    def valid_pos?(pos)
        row, col = pos
        return false if row < 0 || row > 7 || col < 0 || col > 7
        true
    end

    def add_piece(piece, pos)
        if self.valid_pos?(pos) && self.empty?(pos)
            self[pos]= piece # self[[pos]]
        end 
    end


    def checkmate?(color)

    end

    def in_check?(color)
    end

    def find_king(color)
        if color == :white && @board[pos] == "♔"
            return pos 
        elsif color != :white && @board[pos] == "♚"
            return pos
        end
        nil 
    end

    def pieces
        self.Pieces.new(white,board,pos) #? 
      
    end

    def dup
        new_board = Board.new

        
        new_board()

        # duped_grid = @rows.map do |row|
        #   row.map { |piece| Piece.new(piece.symbol) }
        # end

        # Board.new(duped_grid)
    end

    def empty?(pos)
        self[pos].nil?
    end


end


# pawns: if havent moved yet, then move 2 spaces. if already moved, then move 1 space
    # pawns capture diagonally
    # if pawns make it to the other side, you can bring back a piece 
# knight can go over 2 and up one
# bishop moves diagonally
# king can move any direction but only one spot
# rook can move up/down/left/rights, as many spaces as possible
# queen can move any direction but as far as she wants
# goal is get opponent in checkmate & king can't move anywhere without being captured
# move_dirs = direction
