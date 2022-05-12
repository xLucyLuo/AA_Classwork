require_relative "peices.rb"
require_relative "steppable.rb"
class King < Piece
  include Steppable

  def sym
  return "K" 
  end

  def move_diff
   KING
  end

end
