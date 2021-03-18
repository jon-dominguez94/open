class Board

    def self.from_file(filename)
        grid = []
        File.foreach(filename) do |line|
            grid << line.chomp.split("").map(&:to_i)
        end
        self.new(grid)
    end

    def initialize(grid)
        @grid = grid
    end
    
end