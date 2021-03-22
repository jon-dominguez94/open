require_relative 'tile.rb'

class Board

    attr_accessor :grid

    def self.from_file(filename)
        grid = []
        File.foreach(filename) do |line|
            grid << line.chomp.split("").map {|el| Tile.new(el.to_i)}
        end
        self.new(grid)
    end

    def initialize(grid)
        @grid = grid
    end

    def render
        @grid.each {|row| puts self.row_to_s(row)}
        nil
    end

    def []=(pos, val)
        row, col = pos
        tile = @grid[row][col]
        tile.value = val
    end

    def won?
        self.all_rows?(@grid) 
        # && self.all_columns? && self.all_squares?
    end

    protected
    def row_to_s(row)
        row.map(&:render).join("|")
    end

    def all_rows?(grid)
        grid.all? {|row| self.row_solved?(row)}
    end

    def row_solved?(row)
        row.map {|el| el.value}.sort == (1..9).to_a
    end
end

# raise 'Cannot change given values' if @given