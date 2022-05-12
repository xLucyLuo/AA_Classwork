require_relative "peices.rb"
require_relative "steppable.rb"
class Knight < Piece
  include Steppable

  def sym
  return "N" 
  end

  def move_diff
    KNIGHT
  end

end
