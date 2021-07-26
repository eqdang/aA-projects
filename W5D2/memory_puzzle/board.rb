require_ game
require_ card


class Board
    def initialize(size = 4)
        @grid = Array.new(size){ Array.new(size, " " )}
    end

    def [](guess)
        row, col = guess
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def num_cards
        @card.length
    end

    def populate
        
    end

    def render
        @guess
    end

    def won?
        if card.length
    end

    

end