require_relative 'tile.rb'

class Board

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
        @grid.each {|row| puts convert_row(row)}
        nil
    end

    protected
    def convert_row(row)
        row.map(&:render).join("|")
    end
end