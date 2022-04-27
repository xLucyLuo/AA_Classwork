class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "#{self.mark}'s move. Please enter position of move (format ""row col"" as two numbers with space in between. e.g. '0 2'):"
        input = gets.chomp.split(" ")

        raise "invalid input" if !input.all?{|chr| chr.to_i.to_s == chr} || input.length > 2

        input = input.map(&:to_i)
    end
end

# player_1 = HumanPlayer.new(:X) #<HumanPlayer:0x @mark=:X>
# player_1.mark #:X
# p player_1.get_position
