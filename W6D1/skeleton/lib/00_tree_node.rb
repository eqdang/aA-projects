class PolyTreeNode
    attr_reader :parent, :children, :value
    
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        unless parent == nil
            parent.children.delete(self)
        end

        @parent = new_parent
        parent.nil? ? nil : parent.children << self
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if !children.include?(child_node)
            raise 'node is not a child'
        end
    
        @children.delete(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        self.children.each do |child|
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil? 
        end
        return self if target_value == self.value
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            first = queue.shift
            return first if first.value == target_value
            queue += first.children
        end
        nil
    end

end