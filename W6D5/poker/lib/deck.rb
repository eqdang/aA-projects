require_relative "card"

class Deck

    attr_accessor :cards

    def initialize
        @cards = []
        populate_deck
    end
    
    def populate_deck
        set = %w(2 3 4 5 6 7 8 9 10 J Q K A) #= ["1","2"...."A"]
        suits = [:diamond, :heart, :club, :spade]
        
        (0..3).each do |i|
            suit = suits[i]
            set.each do |val|
                self.cards << Card.new(val, suit)
            end
        end
    end

    def shuffle
        self.cards.shuffle
    end

end