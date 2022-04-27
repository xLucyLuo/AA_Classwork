class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position (legal_positions)
        begin
            puts "#{self.mark}'s move. Please enter position of move (format ""row col"" as two numbers with space in between. e.g. '0 2'):"
            input = gets.chomp.split(" ")
            raise StandardError.new "invalid input" if !input.all?{|chr| chr.to_i.to_s == chr} || input.length > 2
            input = input.map(&:to_i)
            raise StandardError.new "#{input.to_s} is not a legal position!" if !legal_positions.include?(input)
        rescue StandardError => e
            puts e.message + " Please try again."
            retry
        end
        input
    end
end


# p dave = HumanPlayer.new(:X) #<HumanPlayer:0x @mark=:X>

# p positions = [[1, 2], [3, 4], [4, 3]] #[[1, 2], [3, 4], [4, 3]]

# p dave.get_position(positions) #3 4 => [3, 4]

# p dave.get_position(positions) #2 5 => [2, 5] is not a legal position
# #Player X, enter two numbers representing a position in the format `row col`
# #1 2
# #=> [1, 2]
