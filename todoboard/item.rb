class Item

    attr_accessor :title, :deadline, :description

    def self.valid_date?(date_string)

        year,month,date = date_string.split("-")

        return false if year.length != 4
        return false if month.length != 2
        return false if date.length != 2
        return false if month.to_i < 0 || month.to_i > 12
        return false if date.to_i < 0 || date.to_i > 31 
        
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline) == false
            raise "deadline is not valid"
        else
            @deadline = deadline
        end
        @description = description
    end

end