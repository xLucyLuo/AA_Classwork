require "byebug"
module Slideable
    HORIZONTAL_DIRS = [[1,0],[0,1],[-1,0],[0,-1]]
    # [1,0]
    # [0,1]
    # [-1,0]
    # [0,-1]


                        
    DIAGONAL_DIRS = [[1,1],[-1,1],[-1,-1],[1,-1]]

    def move #possible?
      all_moves = []
      move_dir.each do |direction|
        r, c = direction
        temp_moves = []
        next_pos = [self.pos[0] + r , self.pos[1] + c]
        #debugger
        until next_pos[0] > 7 || next_pos[1] > 7 || next_pos[0] < 0 || next_pos[1] < 0 || !board[next_pos].empty? 
          temp_moves << next_pos
          next_pos = [next_pos[0]+r, next_pos[1]+c]
        end

        if next_pos[0] <= 7 && next_pos[1] <= 7 && next_pos[0] >= 0 && next_pos[1] >= 0 &&   board[next_pos].color != self.color   
          temp_moves << next_pos
        end

        all_moves += temp_moves
      end
      #debugger
      return all_moves
    end

 end