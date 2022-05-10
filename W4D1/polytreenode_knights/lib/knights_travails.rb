require_relative "00_tree_node.rb"
require 'byebug'
class KnightPathFinder
    def initialize(pos)
        @start_pos = PolyTreeNode.new(pos)
        @considered_positions = [@start_pos.value]
    end

    def build_move_tree
        queue = [@start_pos]
        until queue.empty?
            curr = queue.shift
            # p curr.value
            new_moves = new_move_positions(curr.value) 
            new_moves.each do |position|
                child = PolyTreeNode.new(position)
                child.parent = curr 
                queue << child
            end
        end
        @start_pos
    end

    def [](pos)
    end
    
    def self.valid_moves(pos)
        row, col = pos
        all_moves = [[row+1,col+2],[row-1,col+2],[row+1,col-2],[row-2,col+1],[row-2,col-1],[row+2, col-1],[row+2,col+1],[row-1,col-2]]
        all_moves.select do |position|
            new_row, new_col = position
            new_row > 0 && new_row < 8 && new_col > 0 && new_col < 8
        end
    end

    def new_move_positions(pos)
        positions = KnightPathFinder.valid_moves(pos).select{|position| !@considered_positions.include?(position)}
        @considered_positions += positions
        positions
    end

    def find_path(end_pos)
        #build out move tree for start position node
        self.build_move_tree
        #finding the end position node
        end_node = @start_pos.bfs(end_pos)
        # debugger
        #find the path back from end position to start position
        self.trace_path_back(end_node)

        
    end

    def trace_path_back(end_node)
        #input: self= end_pos
        #output: [start_pos, ..... , end_pos]
        trace_positions = [end_node.value]
        curr_node = end_node
        until curr_node.parent.nil?
            trace_positions.unshift(curr_node.parent.value)
            curr_node = curr_node.parent
        end
        trace_positions
    end
end
k = KnightPathFinder.new([0,0])

p k.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p k.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
