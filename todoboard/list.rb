class List
    
    attr_accessor :label

    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description=nil)
        description ||= ""
        new_item = Item.new(title, deadline, description)

        if Item.valid_date?(deadline)
            @items << new_item  # valid
            return true
        else
            return false        # invalid
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        index < self.size && index > 0
    end

    def swap(index_1, index_2)
        if valid_index?(index_1) && valid_index?(index_2)
            # both valid
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            return true
        else
            # either is invalid
            return false
        end
    end

    def [](index)
        if valid_index?(index)
            return @items[index]
        else
            return nil
        end
    end

    def print
        line = "------------------------------------------"
        p line
        p @list.label.upcase
        p line
        p "Index | Item                 | Deadline"
        p line
        @items.each_with_index do |item, idx|
        puts idx.ljust(6) + "| " + item.description.ljust(21) + "| " + item.deadline
        p line     
        end
    end

    def print_full_item(index)
        if valid_index?(index)
            line = "------------------------------------------"
            p line
            p @items.title + "|" | @items.deadline
            p @items.description
            p line
        end
    end

    def print_priority
        index = @items[0]
        self.print_full_item(index)
    end
        
    def up(index, amount=1)
        amount ||= 1
        if valid_index?(index) == false
            return false
        else
            amount.times { @items[index], @items[index+1] = @items[index+1], @items[index] }
        end
    end

    def down(index, amount=1)
        amount ||= 1
        if valid_index?(index) == false
            return false
        else
            amount.times do
                 @items[index], @items[index-1] = @items[index-1], @items[index] 
            end
            return true
        end
    end

    def sort_by_date!
        @items.sort_by { |item| @deadlines }
    end

end