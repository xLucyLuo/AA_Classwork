require_relative "peices.rb"
require_relative "slideable.rb"

class Bishop < Piece
  include  Slideable


  def sym
  return "B" 
  end

  def move_dir
    DIAGONAL_DIRS
  end


end
