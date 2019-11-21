require "byebug"

# Phase 0
require_relative '00_tree_node.rb'

class KnightPathFinder
    attr_accessor :considered_positions, :root_node
    
    def self.valid_moves(pos) 
        x,y = pos[0], pos[1]
        valids =  [ [x+2, y+1], [x+1, y+2], [x-1, y+2], 
                    [x-2, y+1], [x-2, y-1], [x-1, y-2], 
                    [x+1, y-2], [x+2, y-1] ]
        valids.select {|pair| pair[0] >= 0 && pair[1] >= 0 && pair[0] < 8 && pair[1] < 8}
    end
    
    def initialize(position)
        @root_node = PolyTreeNode.new(position)
        @considered_positions = []
        self.build_move_tree
    end

    def new_move_positions(pos)
        all_possible_moves = KnightPathFinder.valid_moves(pos)
        unconsidered_positions = []
        all_possible_moves.each { |pos| unconsidered_positions << pos unless considered_positions.include?(pos) }
        self.considered_positions += unconsidered_positions
        unconsidered_positions
    end

    def build_move_tree
        queue = [@root_node]
        until queue.empty?
            # debugger
            parent = queue.shift              
            #=> root_node
            next_moves = new_move_positions(parent.value)  
            #=> all the place we can move from root_node
            
            children = next_moves.map {|pos| PolyTreeNode.new(pos)} 
            #=> make nodes from each position
            children.each {|child| child.parent = parent }
            queue += children
        end
        return root_node
    end
end