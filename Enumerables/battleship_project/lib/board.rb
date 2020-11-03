class Board
  
    def initialize(num)
        @grid = Array.new(num) {Array.new(num, :N)}
        @size = num * num
    end

    def size
        @size
    end

    def [] (indices)
        row = indices[0]
        col = indices[1]
        @grid[row][col] 
    end

    def []=(pos, val)       # pos = [#, #]
        row = pos[0]
        col = pos[1]
        @grid[row][col] = val 
    end

    def num_ships
        count = 0
        @grid.each do |row|
            row.each do |elm|
                count +=1 if elm == :S
            end
        end
        count
    end

## PART 2 ##

    def attack(position)
        if self.[](position) == :S
            self.[]=(position, :H) 
            puts "you sunk my battleship!"
            return true
        else
            self.[]=(position, :X) 
            return false
        end
    end

    def place_random_ships
        num_ships = @size / 4
        i = 0
        while i < num_ships
            row = rand(@grid.length) 
            col = rand(@grid.length)
            unless self.[]([row, col]) == :S
                self.[]=([row, col], :S)
                i += 1
            end
        end
    end

    def hidden_ships_grid
        new_arr = Array.new(@grid.length) {Array.new(@grid.length) }
        @grid.each.with_index do |row, row_idx|
            row.each.with_index do |elm, col_idx|
                new_arr[row_idx][col_idx] = elm
                new_arr[row_idx][col_idx] = :N if elm == :S
            end
        end
        new_arr
    end

    def self.print_grid(arr_g)
        print "/"
        arr_g.each do |row|
            row.each.with_index do |elm,idx|
                if idx == row.length - 1
                    print elm
                else
                    print "#{elm} "
                end
            end
            puts
        end
        print "/"
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
