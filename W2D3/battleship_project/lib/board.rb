require "byebug"
class Board
    def initialize (n)
        @grid = Array.new(n){Array.new(n,:N)}
        @size = n*n
    end

    attr_reader :size

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def num_ships
        @grid.flatten.count{|el| el == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        end

        self[pos] = :X
        false
    end

    def place_random_ships
        set_pos = (0..@size-1).to_a.sample(@size/4)
        n = @grid.length

        (0..@size-1).each do |i|
            if set_pos.include?(i)
                x = i/n
                y = i%n
                self[[x,y]] = :S
            end
        end
        @grid
    end

    def hidden_ships_grid
        #debugger
        @grid.map {|subarr| subarr.map {|pos| pos == :S ? :N : pos}}
    end

    def self.print_grid (grid)
        grid.each do |row|
            str = row.map{|el| el.to_s + " "}.join
            puts str[0...str.length-1]
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
