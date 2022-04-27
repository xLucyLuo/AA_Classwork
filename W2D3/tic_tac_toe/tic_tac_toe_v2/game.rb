require_relative "board"
require_relative "human_player"

class Game

    def initialize (n, *marks)
        @players = marks.map{|mark|HumanPlayer.new(mark)}
        @current_player = @players[0]
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = @players.rotate![0]
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

# p g = Game.new(4, 'A', 'B', 'C')#<Game:0x
# #  @board=
# #   #<Board:0x
# #    @grid=[["_", "_", "_", "_"],
# #           ["_", "_", "_", "_"],
# #           ["_", "_", "_", "_"],
# #           ["_", "_", "_", "_"]]>,
# #  @current_player=#<HumanPlayer:0x @mark="A">,
# #  @players=
# #   [#<HumanPlayer:0x @mark="A">,
# #    #<HumanPlayer:0x @mark="B">,
# #    #<HumanPlayer:0x @mark="C">]>

# p g.switch_turn#<HumanPlayer:0x @mark="B">

# p g.switch_turn#<HumanPlayer:0x @mark="C">

# p g #<Game:0x
# #  @board=
# #   #<Board:0x
# #    @grid=[["_", "_", "_", "_"],
# #           ["_", "_", "_", "_"],
# #           ["_", "_", "_", "_"],
# #           ["_", "_", "_", "_"]]>,
# #  @current_player=#<HumanPlayer:0x @mark="C">,
# #  @players=
# #   [#<HumanPlayer:0x @mark="C">,
# #    #<HumanPlayer:0x @mark="A">,
# #    #<HumanPlayer:0x @mark="B">]>
