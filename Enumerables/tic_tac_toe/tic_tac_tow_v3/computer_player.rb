class ComputerPlayer

    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        random = legal_positions.sample
        p self.mark
        p random
        return random
    end
end