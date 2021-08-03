
class Card
    attr_reader :face_value
    def initialize(face_value)
        @face_up = false
        @face_value = face_value

    end

   # "can you hear me" "are you able to see the Audio Call within VS"
#    def face_value=()

#    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
        @face_value
    end

    def to_s
        if @face_up
            return self.face_value
        else
            return "-"
        end
    end

    def ==(other_card)
        if other_card.is_a? self.class
            return true if self.face_value == other_card.face_value
        end
        false
    end


end