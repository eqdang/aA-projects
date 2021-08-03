require_relative "room"

class Hotel
  
    def initialize(name, room_hash)
        @name = name
        @rooms = {}

        room_hash.each do |room_name, capacity|
            @rooms[room_name] = Room.new(capacity)
        end
        
    end

    def name
        words = @name.split(" ").map { |ele| ele.capitalize }
        words.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        if self.room_exists?(room_name)
            if self.rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist" 
        end
    end

    def has_vacancy?
        rooms.each_key do |room_name|
            return false if self.rooms[room_name].available_space == 0
        else
            return true
        end
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts "#{room_name}" "#{room.available_space}"
        end
    end

end
