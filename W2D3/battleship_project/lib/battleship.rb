require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        p @board.num_ships
        @board.print
    end

    def lose?
        return false if @remaining_misses > 0

        puts "you lose"
        true
    end

    def win?
        return false if board.num_ships > 0 

        puts "you win"
        true
    end

    def game_over?
        win? || lose?
    end

    def turn
        @remaining_misses -=1 if !board.attack(@player.get_move)
        board.print
        puts @remaining_misses

    end
end
