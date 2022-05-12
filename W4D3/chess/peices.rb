require_relative "board.rb"

class Piece
  attr_accessor :pos
  attr_reader :sym, :board, :color

  def initialize(color, board, position)
    # @sym = "P"
    @board = board
    @color = color
    @pos = position
  #placeholder for type?
  end

  def empty?
    false
  end

end

#types to be sbclasses, likely not use peice superclass

#peice