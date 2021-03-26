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

    def [](pos)
        row, col = pos
        tile = @grid[row][col]
        tile
    end

    def []=(pos, val)
        row, col = pos
        tile = @grid[row][col]
        tile.value = val
    end

    def won?
        self.all_rows?(@grid) && 
        self.all_columns?
        self.all_squares?
    end

    protected
    def row_to_s(row)
        row.map(&:render).join("|")
    end

    def all_rows?(grid)
        grid.all? {|row| self.solved?(row)}
    end

    def solved?(tiles)
        tiles.map {|el| el.value}.sort == (1..9).to_a
    end

    def all_columns?
        self.all_rows?(@grid.transpose)
    end

    def all_squares?
        squares = self.get_squares
        squares.map! {|square| square.map {|pos| self[pos]}}
        squares.all? {|tiles| self.solved?(tiles)}
    end

    def get_squares
        corners = self.get_corners
        corners.map {|corner| self.get_block(corner)}
    end

    def get_block(corner)
        i, j = corner
        positions = []
        (i...i+3).each do |row|
            (j...j+3).each do |col|
                positions << [row, col]
            end
        end
        positions
    end

    def get_corners
        corners = []
        points = [0, 3, 6]
        points.each do |i|
            points.each do |j|
                corners << [i,j]
            end
        end
        corners
    end

end

# raise 'Cannot change given values' if @given