class Player

## PART 3 ##

    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        gets.chomp.split(" ").map { |int| int.to_i }
    end

end
