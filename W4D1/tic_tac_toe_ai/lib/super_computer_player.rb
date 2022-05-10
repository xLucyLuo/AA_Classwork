require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark) #game = TicTacToe.new(board, ....)
    mark == :x ? next_mark = :o : next_mark = :x
    node = TicTacToeNode.new(game.board, next_mark) #[1,2] or nil
    children = node.children
    children.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end

    children.each do |child| 
      return child.prev_move_pos if child.winning_node?(node.next_mover_mark)
    end


    children.each do |child| 
      return child.prev_move_pos if !child.losing_node?(mark)
    end

  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
