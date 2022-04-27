class ComputerPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position (legal_positions)
        chosen_pos = legal_positions.sample
        puts "Computer #{self.mark}'s move is #{chosen_pos[0]} #{chosen_pos[1]}."
        chosen_pos
    end
end

# p hal_9000 = ComputerPlayer.new(:Y) #<ComputerPlayer:0x @mark=:Y>

# p positions = [[1, 2], [3, 4], [4, 3]] #[[1, 2], [3, 4], [4, 3]]

# p hal_9000.get_position(positions)
# # Computer Y chose position [1, 2]
# #=> [1, 2]

# p hal_9000.get_position(positions)
# #Computer Y chose position [3, 4]
# #=> [3, 4]