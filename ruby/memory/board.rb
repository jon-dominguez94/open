require_relative "card.rb"

class Board

    attr_reader :grid

    def initialize(size=4)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
    end
    
    def populate
        values = self.get_values
        length = @grid.length
        (0...length).each do |i|
            (0...length).each do |j|
                @grid[i][j] = values.pop
            end
        end
        nil
    end

    def get_values
        alpha = ('A'..'Z').to_a
        amount_needed = @size**2 / 2
        (alpha.sample(amount_needed) * 2).shuffle
    end

end

b = Board.new
b.populate