require_relative "board"
require_relative "human_player"

class Game

    def initialize (p1_mark, p2_mark)
        @player_1 = HumanPlayer.new(p1_mark)
        @player_2 = HumanPlayer.new(p2_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position, @current_player.mark)
            
            if @board.win?
                puts @current_player.mark.to_s + " has won!!!"
                return
            end
            switch_turn
        end

        puts "Draw."
    end
end

# p game = Game.new(:X, :O) #<Game:0x0
# #  @current_player=#<HumanPlayer:0x @mark=:X>,
# #  @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
# #  @player_1=#<HumanPlayer:0x @mark=:X>,
# #  @player_2=#<HumanPlayer:0x @mark=:O>>

# p game.switch_turn #<HumanPlayer:0x @mark=:O>

# p game #<Game:0x00007f8b5ac725f8
# #  @current_player=#<HumanPlayer:0x @mark=:O>,
# #  @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
# #  @player_1=#<HumanPlayer:0x @mark=:X>,
# #  @player_2=#<HumanPlayer:0x @mark=:O>>

# p game.switch_turn #<HumanPlayer:0x @mark=:X>

# p game #<Game:0x00007f8b5ac725f8
# #  @current_player=#<HumanPlayer:0x @mark=:X>,
# #  @player_1=#<HumanPlayer:0x @mark=:X>,
# #  @player_2=#<HumanPlayer:0x @mark=:O>>
# #  @board=#<Board:0x @grid=[["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]>,
