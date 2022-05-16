require_relative "peices.rb"
require_relative "null.rb"
require_relative "queen.rb"
require_relative "king.rb"
require_relative "rook.rb"
require_relative "bishop.rb"
require_relative "pawn.rb"
require_relative "knight.rb"

require "byebug"


class Board
  attr_reader :board
    def initialize()
      @nullpiece = NullPiece.instance
      @board = Array.new(8) {Array.new(8, @nullpiece)}
      add_piece(Rook.new(:black,self,[0,0]), [0,0])
      add_piece(Knight.new(:black,self,[0,1]), [0,1])
      add_piece(Bishop.new(:black,self,[0,2]), [0,2])
      add_piece(King.new(:black,self,[0,3]), [0,3])
      add_piece(Queen.new(:black,self,[0,4]), [0,4])
      add_piece(Bishop.new(:black,self,[0,5]), [0,5])
      add_piece(Knight.new(:black,self,[0,6]), [0,6])
      add_piece(Rook.new(:black,self,[0,7]), [0,7])
      
      add_piece(Pawn.new(:black,self,[1,0]), [1,0])
      add_piece(Pawn.new(:black,self,[1,1]), [1,1])
      add_piece(Pawn.new(:black,self,[1,2]), [1,2])
      add_piece(Pawn.new(:black,self,[1,3]), [1,3])
      add_piece(Pawn.new(:black,self,[1,4]), [1,4])
      add_piece(Pawn.new(:black,self,[1,5]), [1,5])
      add_piece(Pawn.new(:black,self,[1,6]), [1,6])
      add_piece(Pawn.new(:black,self,[1,7]), [1,7])

      add_piece(Rook.new(:white,self,[7,0]), [7,0])
      add_piece(Knight.new(:white,self,[7,1]), [7,1])
      add_piece(Bishop.new(:white,self,[7,2]), [7,2])
      add_piece(Queen.new(:white,self,[7,3]), [7,3])
      add_piece(King.new(:white,self,[7,4]), [7,4])
      add_piece(Bishop.new(:white,self,[7,5]), [7,5])
      add_piece(Knight.new(:white,self,[7,6]), [7,6])
      add_piece(Rook.new(:white,self,[7,7]), [7,7])

      add_piece(Pawn.new(:white,self,[6,0]), [6,0])
      add_piece(Pawn.new(:white,self,[6,1]), [6,1])
      add_piece(Pawn.new(:white,self,[6,2]), [6,2])
      add_piece(Pawn.new(:white,self,[6,3]), [6,3])
      add_piece(Pawn.new(:white,self,[6,4]), [6,4])
      add_piece(Pawn.new(:white,self,[6,5]), [6,5])
      add_piece(Pawn.new(:white,self,[6,6]), [6,6])
      add_piece(Pawn.new(:white,self,[6,7]), [6,7])

    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val #piece.value
    end

    def add_piece(piece, pos)
      #row,col = pos
      self[pos]= piece
    end

    def move_piece(start_pos,end_pos) # move_piece([0,0], [2,3])
      #debugger

      if self[start_pos].empty? || !self[start_pos].move.include?(end_pos)  #change back to empty later
        raise "Pick another position"
      end

      if !self[end_pos].empty?
        self[end_pos] = @nullpiece
      end
      self[start_pos].pos = end_pos
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]       
    end



  #initialize creates array

end


#print / render
