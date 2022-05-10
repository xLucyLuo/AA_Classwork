require "byebug"
class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        #debugger
        old_parent = self.parent
        old_parent.delete_child(self) if old_parent != nil
        @parent = node
        node.children << self unless node.nil? || node.include_child?(self)
    end

    def include_child?(node)
        @children.include?(node) 
    end

    def delete_child(node)
        self.children.delete(node)
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        raise "error: node is not a child" if node.parent != self
        node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        
        self.children.each do |child| 
            #if child.value != target_value 
             # inductive case
                result = child.dfs(target_value) 
                return result if result != nil 
            #else
            #    return child 
            #end
        end
        #base case
        return nil
    end

    def bfs(target_value)
        queue = [self]
        until queue == []
            curr = queue.shift
            return curr if curr.value == target_value
            queue += curr.children unless curr.children.empty?
        end
        return nil
    end
end

# n1 = PolyTreeNode.new("1")
# n2 = PolyTreeNode.new("2")
# n3 = PolyTreeNode.new("3")

# n.parent = n2