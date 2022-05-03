require_relative "player.rb"
class Game
    attr_reader :current_player, :fragment 

    def initialize
        @fragment = "zoo"
        @player_1 = Player.new(1)
        @player_2 = Player.new(2)
        @current_player = @player_1

        file = File.new("dictionary.txt")
        dictionary = Hash.new()
        file.readlines().each do |word|
            dictionary[word.chomp] = 1
        end
        @dictionary = dictionary
        
    end   

    def next_player!
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
    end

    def valid_play?(str)
        guess = (@fragment + str)
        @dictionary.each_key do |word|
            return true if word[0...guess.length]==guess
        end
        false
    end

    def take_turn(player)
        input = player.guess
        while !valid_play?(input)
            player.alert_invalid_guess
            input = player.guess
        end
        @fragment += input
    end

    def play_round
        take_turn(@current_player)
        next_player!
    end

end