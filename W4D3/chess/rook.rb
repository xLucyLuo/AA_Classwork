require_relative "peices.rb"
require_relative "slideable.rb"

class Rook < Piece
include  Slideable

  def sym
  return "R" 
  end

  def move_dir
    HORIZONTAL_DIRS
  end


end
