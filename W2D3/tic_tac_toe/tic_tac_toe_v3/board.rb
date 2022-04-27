class Board
    def initialize (n)
        @grid = Array.new(n){Array.new(n,"_")}
    end

    def valid?(pos)
        pos[0] < @grid.length && pos[0] >= 0 && pos[1] < @grid.length && pos[1]>=0
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == "_"
    end

    def place_mark(pos,mark)
        raise "position out of bounds (should be between 0-#{grid.length-1})" if !valid?(pos)
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

   def legal_positions
     legal_pos = []
     @grid.each_with_index do|row,i| 
          row.each_with_index do |el, j|
               legal_pos << [i,j] if empty?([i,j])
          end
     end
     legal_pos
   end
end

# p small = Board.new(4)
# p big = Board.new(6)

# p small.valid?([3, 3]) #true

# p small.valid?([5, 5]) #false

# p big.valid?([5, 5]) #true

# b = big


# b.place_mark([0, 1], :O)
# b.place_mark([1, 1], :X)
# b.place_mark([2, 1], :O)
# b.place_mark([0, 2], :X)
# b.place_mark([1, 2], :O)
# b.place_mark([2, 2], :X)
# b.place_mark([5, 0], :O)
# b.place_mark([2, 0], :X)
# b.place_mark([1, 5], :O)
# b.place_mark([5, 5], :X)
# #  p b.place_mark([0, 0], :O)
# #  p b.place_mark([1, 0], :O)
# #  p b.place_mark([2, 0], :O)

# b.print
# p b.win?
# p b.win_row?
# p b.win_col?
# p b.win_diagonal?
# p b.empty_positions?


# p my_board = Board.new(2) #<Board:0x @grid=[["_", "_"], ["_", "_"]]>

# p my_board.legal_positions #[[0, 0], [0, 1], [1, 0], [1, 1]]

# p my_board.place_mark([0, 1], :Z) #:Z

# p my_board.legal_positions #[[0, 0], [1, 0], [1, 1]]