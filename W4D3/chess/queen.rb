require_relative "peices.rb"
require_relative "slideable.rb"

class Queen < Piece
include  Slideable

  def sym
  return "Q" 
  end

  def move_dir
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

end
