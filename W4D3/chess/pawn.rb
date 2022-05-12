require_relative "peices.rb"
require "byebug"
class Pawn < Piece
#include  Slideable
attr_reader :start_pos1
  def initialize(color, board, position)
    super #specify if not work
    @start_pos1 = position.dup
  end

  def sym
  return "P" 
  end
  
  def first_forward_move
    row, col = self.pos
    #debugger
    if self.color == :white && @board[[row - 2, col]].empty? && @start_pos1 == self.pos && @board[[row - 1, col]].empty?
      new_pos = [row - 2, col]
    end
    
    if self.color == :black && @board[[row + 2, col]].empty? && @start_pos1 == self.pos && @board[[row + 1, col]].empty?
      new_pos = [row + 2, col]
    end
    new_pos
    # debugger
  end
  
  
  def forward_move
    row, col = self.pos
    if row - 1 >= 0 && self.color == :white && @board[[row - 1, col]].empty?
      new_pos = [row - 1, col]   
    end
    
    if row + 1 <= 7 && self.color == :black && @board[[row + 1, col]].empty?
      new_pos = [row + 1, col]   
    end
    new_pos
  end
  
  def side_attack
    new_positions = []
    row, col = self.pos 
    #debugger
    if self.color == :white 
      new_positions << [row - 1, col-1] if row - 1 >= 0 && col - 1 >= 0 && !@board[[row - 1, col-1]].empty?
      new_positions << [row - 1, col+1] if row - 1 >= 0 && col + 1 <= 7 && !@board[[row - 1, col+1]].empty?
    end
    
    if self.color == :black 
      new_positions << [row + 1, col+1] if row + 1 <= 7 && col + 1 <= 7 && !@board[[row + 1, col+1]].empty?
      new_positions << [row + 1, col-1] if row + 1 <= 7 && col - 1 >= 0 && !@board[[row + 1, col-1]].empty?
    end
    new_positions
  end
  
  
    #White on bottom --> can only go up
    #Black on top --> can only go down
  def move
    #debugger
    all_moves = []
    ffm = first_forward_move
    all_moves << ffm if ffm!= nil
    all_moves << forward_move if forward_move != nil
    all_moves += side_attack
    #debugger
  end
end
