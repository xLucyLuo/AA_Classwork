require "deck.rb"

describe Deck do
    subject(:deck) {Deck.new}

    describe "#initialize" do
        it "creates a deck of 52 cards" do 
            expect(deck.cards.length).to eq(52)
        end

        it "no duplicate cards" do
            expect(deck.cards.uniq).to eq(deck.cards)
        end

        it "shuffles the deck" do
            dummy_deck = Deck.new
            expect(deck.cards.shuffle!).not_to eq(dummy_deck.cards)
            #expect(deck.cards.sort).to eq(dummy_deck.cards.sort)
        end
    end
end