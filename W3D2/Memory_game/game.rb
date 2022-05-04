require_relative "board.rb"
require_relative "card.rb"

class Game
    attr_reader :board, :previous_position
    

    def initialize
        @board = Board.new
        @board.populate
        @previous_position = []
    end

    def get_input
        input = []
        while input.length != 2
            puts "Please guess position of card you'd like to flip (e.g, '2, 3')"
            input = gets.chomp.split(",").map(&:to_i)
            if input.length != 2
                puts "Invalid guess, please try again"
            end
        end
        return input
    end

    def start_game
        @board.grid.each do |row|
            row.each do |card|
                card.reveal
            end
        end

        @board.render

        sleep(3)
        
        @board.grid.each do |row|
            row.each do |card|
                card.hide
            end
        end

        @board.render
    end

    def play_game
        2.times do 
            until make_guess(self.get_input)
                puts "already guessed, please guess another position"
            end
            @board.render
        end

        selected_pair = @board.grid.flatten.select {|card| card.face_up }
        selected_values = [selected_pair[0].value, selected_pair[1].value]

        if selected_values.uniq.length != 1 #we were stuck here. Keeps replacing the good guesses we made
            selected_pair[0].hide
            selected_pair[1].hide
        end

        previous_position = []
        @board.render 
    end

    def make_guess(pos)
        row, col = pos
        guess_card = @board.grid[row][col]
        if guess_card.face_up 
            return false
        else
            guess_card.reveal
            @previous_position = pos
            return true
        end
    end
end


