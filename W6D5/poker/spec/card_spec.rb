require "card"

describe Card do
    let(:card) { Card.new(5, :diamond) }

    describe "#initialize" do       
        it "sets a value" do
            expect(card.value).to eq(5)
        end

        it "sets a suit" do
            expect(card.suit).to eq(:diamond)
        end
    end

end