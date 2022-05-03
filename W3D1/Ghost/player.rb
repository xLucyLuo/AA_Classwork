class Player

    def initialize(name)
        @player = name
    end

    def guess
        puts "please input the next letter: "
        input = gets.chomp
    end

    def alert_invalid_guess
        puts "invalid guess, try agian"
    end 

end