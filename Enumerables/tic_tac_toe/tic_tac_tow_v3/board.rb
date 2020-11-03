# # V1
# # load 'board.rb'
# # b = Board.new
# # b.place_mark([-1, 2], :X)
# # b
# # b.place_mark([1, 3], :X) 

# # V2
# # load 'board.rb'
# # small = Board.new(4)
# # large = Board.new(6)
# # small.valid?([3, 3])
# # small.valid?([5, 5])
# # large.valid?([5, 5])


class Board

    attr_reader :grid
    
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end 

    def legal_positions
        open_positions = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |_ele, j|
                position = [i, j]
                open_positions << position if valid?(position) and empty?(position)
            end
        end
        open_positions
    end

    def valid?(position)

        row = position[0]
        col = position[1]

        return false if row > grid.length || col > grid.length

        if self.grid[row][col] == nil || row < 0 || col < 0
            return false
        else
            return true
        end
    end

    def empty?(position)
        @grid[position[0]][position[1]] == "_"
    end

    def place_mark(position, mark) #position = [-1,2]
        if self.valid?(position) && self.empty?(position)
            @grid[position[0]][position[1]] = mark
        else
            raise "Invalid Mark"
        end
    end

    def print
        puts "///////////////////////////"
        puts "/    Tic   Tac     Toe    /"
        puts "///////////////////////////"
        i = 0
        while i < @grid.length-1
            p @grid[i] #prints out the row
            i += 1
        end
        # puts "------------"
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.all? {|space| space == mark}
        end
        return false 
    end

    def win_col?(mark)
         @grid.transpose.each do |row|
            return true if row.all? {|space| space == mark}
        end
        return false 
    end

    def win_diagonal?(mark)
        (0...grid.length).each { |i| return false if mark != @grid[i][i]}
        
        flipped = (@grid.transpose.map(&:reverse))
        (0...flipped.length).each { |i| return false if mark != flipped[i][i] }
        true 
    end

    def win?(mark)
        win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            return true if row.any? {|space| space == "_"}
        end
        return false  
    end
    
#
end












