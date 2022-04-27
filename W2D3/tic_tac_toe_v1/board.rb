class Board
    def initialize
        @grid = Array.new(3){Array.new(3,"_")}
    end

    def valid?(pos)
        pos[0] <= 2 && pos[0] >= 0 && pos[1]<=2 && pos[1]>=0
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def place_mark(pos,mark)
        raise "position out of bounds (should be between 0-2)" if !valid?(pos)
        raise "position already taken" if !empty?(pos)

        @grid[pos[0]][pos[1]] = mark
    end

   def print
        (0...@grid.length).each do |i|
            puts @grid[i].to_s
        end
   end

   def win_row?
        @grid.any?{|row| row.uniq.length == 1 && row[0] !="_"}
   end

   def win_col?
        @grid.transpose.any?{|col| col.uniq.length == 1 && col[0]!="_"}
   end

   def win_diagonal?
        diagonal_1 = (0...@grid.length).map{|i| @grid[i][i]}
        diagonal_2 = (0...@grid.length).map{|i| @grid[i][-(i+1)]}
        
        (diagonal_1.uniq.length == 1 && diagonal_1[0] !="_") || (diagonal_2.uniq.length == 1 && diagonal_2[0] !="_")
   end

   def win?
        win_row? || win_col? || win_diagonal?
   end

   def empty_positions?
        @grid.flatten.count{|el| el == "_"}>0
   end
end

# p b = Board.new

# b.place_mark([0, 1], :O)
# b.place_mark([1, 1], :X)
# b.place_mark([2, 1], :O)
# b.place_mark([0, 2], :X)
# b.place_mark([1, 2], :O)
# b.place_mark([2, 2], :X)
# b.place_mark([0, 0], :O)
# b.place_mark([2, 0], :X)
# b.place_mark([1, 0], :O)
# #  p b.place_mark([0, 0], :O)
# #  p b.place_mark([1, 0], :O)
# #  p b.place_mark([2, 0], :O)

# b.print
# p b.win?
# p b.win_row?
# p b.win_col?
# p b.win_diagonal?
# p b.empty_positions?