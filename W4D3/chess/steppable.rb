module Steppable

  KNIGHT = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]]
  
  KING = [[1,1],[-1,1],[-1,-1],[1,-1],[1,0],[0,1],[-1,0],[0,-1]]

    def move
        all_moves = []
        move_diff.each do |direction|
            r, c = direction
            next_pos = [self.pos[0] + r , self.pos[1] + c]
            out_border = next_pos[0] > 7 || next_pos[1] > 7 || next_pos[0] < 0 || next_pos[1] < 0 
            if !out_border && (board[next_pos].empty? || (!board[next_pos].empty? && board[next_pos].color != self.color))
                all_moves << next_pos
            end
        end
        return all_moves
    end
end
