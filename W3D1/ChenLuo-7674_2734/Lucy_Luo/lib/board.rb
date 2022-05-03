class Board
    attr_reader :size
    
    def initialize(size)
        @size = size
        @grid = Array.new(size){Array.new(size)}
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, mark)
        row,col = pos
        @grid[row][col] = mark
    end

    def complete_row?(mark)
        @grid.each do |row|
            return true if row.all?{|el| el == mark}
        end
        false
    end

    def complete_col?(mark)
        @grid.transpose.each do |col|
            return true if col.all?{|el| el == mark}
        end
        false
    end

    def complete_diag?(mark)
        diag1 = @grid.each_with_index.map{|row,i| @grid[i][i]}
        diag2 = @grid.each_with_index.map{|row,i| @grid[i][-(i+1)]}

        # diag1 = []
        # diag2 = []
        
        # @grid.each_with_index do |row,i|
        #     row.each_with_index do |el,j|
        #         diag1 << el if i == j
        #         diag2 << el if i == (@grid.length - j -1)
        #     end
        # end
           
        diag1.all?{|line| line == mark} || diag2.all?{|line| line == mark}

    end

    def winner?(mark)
        complete_row?(mark) || complete_col?(mark) || complete_diag?(mark)
    end

    # This Board#print method is given for free and does not need to be modified
    # It is used to make your game playable.
    def print
        @grid.each { |row| p row }
    end
end
