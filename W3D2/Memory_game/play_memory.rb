require_relative "game.rb"

game = Game.new

game.start_game

until game.board.won?
    game.play_game
end

puts "you won!"
