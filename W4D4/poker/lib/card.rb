class Card
    attr_reader :value, :suite, :symbol
    def initialize(value, suite, symbol)
        @value = value
        @suite = suite
        @symbol = symbol
    end
end