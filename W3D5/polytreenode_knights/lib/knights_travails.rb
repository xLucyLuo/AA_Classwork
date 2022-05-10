require_relative "00_tree_node.rb"
class KnightPathFinder
    @considered_positions = [@root_node]
    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
    end

    def build_move_tree

    end

    def [](pos)
    end
    
    def self.valid_moves(pos)
        row, col = pos
        all_moves = [[row+1,col+2],[row-1,col+2],[row+1,col-2],[row-2,col+1],[row-2,col-1],[row+2, col-1],[row+2,col+1],[row-1,col-2]]
    end

    def new_move_position(pos)
        KnightPathFinder.valid_moves(pos).select{|position| !considered_positions.include?(position)}
    end

end
    k = KnightPathFinder.new([0,0])