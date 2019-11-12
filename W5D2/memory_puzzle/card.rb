require_relative "game"
require_relative "board"

class Card
    VALUE = ("a".."z").to_a
    
    attr_reader :ran_cards

    def initialize(value, face=false)
        @value = value
        @face = face
    end

    def self.random_cards(size)
        ran_cards = (Array.new((size*size)/2) {VALUE.sample}) * 2
        Card.new(ran_cards, face)
    end

    def self.randomly_places
        card_spaces = (size * size)
        while self.matches < @board.win
        
            rand_row = rand(0...@grid.length)
            rand_col = rand(0...@grid.length)
            @grid[rand_row][rand_col] = self.random_cards(size)
        end

    end

    def length
        @length = self.value.length
    end

    def hide
        @hide = hide
    end

    def reveal
        @reveal = reveal
    end

    def to_s
         @to_s = to_s
    end

    def ==
        
    end
end