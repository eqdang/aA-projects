require "deck"

describe Deck do
    let(:deck) { Deck.new }
    let(:diamond) { Card.new("3", :diamond)}
    let(:clubs) { Card.new("3", :club)}
    let(:hearts) { Card.new("3", :heart)}
    let(:spades) { Card.new("3", :spade)}    
    
    describe "#initialize" do
        it "is an array of 52 cards" do
            expect(deck.cards.length).to eq(52)
        end
    end

    #describe "#populate_deck" do
    #    it "populates cards with 4 suits" do 
    #        expect(deck.populate_deck).to include(card.suit) 
    #        expect(deck.populate_deck).to include(:clubs.suit)
    #        expect(deck.populate_deck).to include(:hearts.suit)
    #        expect(deck.populate_deck).to include(:spades.suit)
    #    end 
    #end

    describe "#shuffle" do
        it "is shuffled" do
            cards = [].concat(deck.cards)
            expect(deck.shuffle).not_to eq(cards)
        end
    end

    describe "#deal_cards" def 
        it "takes a number as an argument" do
            expect(deck.deal_cards).to raise_error(ArgumentError)
            expect(deck.deal_cards(5)).not_to raise_error
        end 
    
        it "removes # of cards from top of deck" do
            cards = [].concat(deck.cards)
            deck.deal_cards(5)
            expect(deck.cards.length).to eq(47)
            expect(deck.cards).to eq(cards[5..-1])
        end
    end

end


# diamonds = Card.new("3", :diamonds)
