require_relative "card.rb"
class Board
    attr_reader :grid

    def initialize()
        @grid = Array.new(4) {Array.new(4)}
    end
    
    def populate
        alpha = ("a".."z").to_a
        num_pairs = (@grid.length * @grid[0].length) / 2 #this gives num of unique cards we want

        selected = []

        while selected.length < num_pairs
            samp = alpha.sample
            selected << samp if !selected.include?(samp)
        end

        selected += selected
        
        
        while selected.length > 0
            row = rand(0...@grid.length)
            col = rand(0...@grid.length)

            if @grid[row][col] == nil
                @grid[row][col] = Card.new(selected.pop)
            end
        end
    end

    def render
        system("clear")

        @grid.each do |row|
            row_string = ""
            row.each do |card|
                row_string += card.to_s
            end
            p row_string
        end
    end

    def won?
        return false if @grid.flatten.count{|card| card.to_s == " "} > 0
        true
    end

    def reveal(pos)
        row = pos[0]
        col = pos[1]
        @grid[row][col].reveal
        @grid[row][col].value
    end
end