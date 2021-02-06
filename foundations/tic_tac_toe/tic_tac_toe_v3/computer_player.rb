class ComputerPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        puts "CPU places " + @mark.to_s + " at position: " + pos.to_s
        pos
    end
end