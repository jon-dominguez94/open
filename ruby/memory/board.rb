require_relative "card.rb"

class Board

    attr_reader :size

    def initialize(size=4)
        @grid = Array.new(size) {Array.new(size)}
        @size = size
    end
    
    def populate
        values = self.get_values
        length = @grid.length
        (0...length).each do |i|
            (0...length).each do |j|
                pos = [i,j]
                self[pos] = Card.new(values.pop)
            end
        end
        nil
    end

    def reveal(pos)
        card = self[pos]
        card.reveal
    end

    def render
        @grid.each do |row| 
            vals = row.map do |card|
                card.value
            end
            puts vals.join(" | ")
        end
        nil
    end

    def won?
        @grid.all? do |row|
            row.all? do |card|
                card.revealed
            end
        end
    end

    def hidden?(pos)
        !self[pos].revealed
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    protected
    
    def get_values
        alpha = ('A'..'Z').to_a
        amount_needed = @size**2 / 2
        (alpha.sample(amount_needed) * 2).shuffle
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
        value
    end

end