require_relative "card.rb"

class Deck
    attr_reader :cards
    def initialize
        @cards = []

        symbols = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
        suites = [:D, :C, :H, :S]
        (0...13).each do |i|
            (0...4).each do |j|
                @cards << Card.new(i+1, suites[j], symbols[i])
            end
        end
    end
    
    def shuffle!
        @cards.shuffle!
    end
end