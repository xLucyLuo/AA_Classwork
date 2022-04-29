class Board
    attr_reader :max_height

    def self.build_stacks (num_stacks)
        stacks = Array.new(num_stacks){Array.new(0)}
    end

    def initialize (num_stacks, max_height)
        raise "rows and cols must be >= 4" if num_stacks < 4 || max_height <4
        @max_height = max_height
        @stacks = Board.build_stacks(num_stacks)
    end

    def add(token, stack_index)
        return false if @stacks[stack_index].length >= @max_height
        @stacks[stack_index] << token
        true
    end

    def vertical_winner?(token)
        @stacks.any?{|stack| stack.count{|el| el == token} == @max_height}
    end

    def horizontal_winner?(token)
        count  = 0
        (0...@max_height).each do |col|
            (0...@stacks.length).each do |row|
                count += 1 if @stacks[row][col] == token
            end
            return true if count == @stacks.length
            count = 0
        end
        false
    end

    def winner? (token)
        vertical_winner?(token) || horizontal_winner?(token)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @stacks.each { |stack| p stack }
    end
end
