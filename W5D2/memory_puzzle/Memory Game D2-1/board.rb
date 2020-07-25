require_relative "card.rb"

class Board

    def initialize(num = 4)

        @cards = Array.new(num) { Array.new(num, nil)}
        #@card = Card.new

    end

    def populate
        #@cards << Card.new
        #a set of shuffled card pairs ...
        values = self.all_values
        
        while self.available_spaces.length > 0
            indices = self.available_spaces
            val = values.shift
            idx1, idx2 = indices.sample
            idx3, idx4 = indices.sample
            while (idx3 == idx1) && (idx4 == idx2)
                idx3, idx4 = indices.sample
            end
            @cards[idx1][idx2] = Card.new(val)
            @cards[idx3][idx4] = Card.new(val)
        end

        @cards

    end
    
    def available_spaces
        spaces = []
        @cards.each_with_index do |row, idx1|
            row.each_with_index do |elm, idx2|
                if self.empty?(idx1,idx2)
                    spaces << [idx1,idx2]
                end
            end
        end
        spaces
    end
    
    def empty?(num1, num2)
        return true if @cards[num1][num2] == nil
        false
    end

    def all_values #gets values to populate
        num = @cards.length
        num_2 = (num ** 2) / 2
        values = ("A".."Z").to_a
        included = []
        while included.length < num_2
            val = values[rand(25)]
            included << val unless included.include?(val)
        end
        included
    end


    def render 
     #@cards
     #Basic_Width = num
        print "    0  1  2  3 "
        @cards.each_with_index do |row, idx1|
            print "\n #{idx1} "
            row.each_with_index do |col, idx2|
                print " #{col.to_s} "
            end
        end
        puts #"Hallelujiah"
    end






    #  puts "0   #{@cards[0][0].to_s}  #{@cards[0][1].to_s}  #{@cards[0][1].to_s}     #{@cards[0][1].to_s}          "
    #  puts "1                      "
    #  puts "2                      "
    #  puts "3                      "

    def won?
        return true if @cards.all? {|card| card.face_up}
        false
    end

    def reveal_card(num1, num2)
        return @cards[num1][num2].reveal
    end


end