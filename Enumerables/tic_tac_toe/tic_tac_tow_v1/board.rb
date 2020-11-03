# load 'board.rb'
# b = Board.new
# b.place_mark([-1, 2], :X)
# b
# b.place_mark([1, 3], :X) 

class Board 
    attr_accessor :grid
    def  initialize 
        @grid = Array.new(3) {Array.new(3, "_")}
    end 

    def valid?(position)
        row = position[0]
        col = position[1]
        if @grid[row][col] == nil || row < 0 || col < 0
             false
        else
            true
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
        p
        p
        p @grid[0]
        p @grid[1]
        p @grid[2]

        puts "------------"
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












