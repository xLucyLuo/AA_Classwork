require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark #:x or :o
    @prev_move_pos = prev_move_pos

  end

  def losing_node?(evaluator)
    return false if (@board.winner.nil? || @board.winner == evaluator) && @board.over?
    return true if @board.winner != evaluator && @board.over?
    
    player_losing = self.children.all? do |position|
      position.losing_node?(evaluator)
    end

    opponent_losing = self.children.any? do |position|
      position.losing_node?(evaluator)
    end

    player_losing || opponent_losing
  end

  def winning_node?(evaluator)
    if @board.over? 
      return true if @board.winner == evaluator
      return false if @board.winner.nil? || @board.winner == @next_mover_mark
    end

    children = self.children
    player_winning = children.any? do |child|
      child.winning_node?(evaluator)
    end

    opponent_winning = children.all? do |child|
      child.winning_node?(evaluator)
    end

    player_winning || opponent_winning

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_positions = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |el, j|
        if @board.empty?([i, j])
          next_board = @board.dup
          next_board[[i, j]] = @next_mover_mark
          if @next_mover_mark == :x
            next_next_mover_mark = :o
          else
            next_next_mover_mark = :x
          end
          empty_positions << TicTacToeNode.new(next_board, next_next_mover_mark, [i, j])
        end
      end
    end

    empty_positions
  end

    
end
