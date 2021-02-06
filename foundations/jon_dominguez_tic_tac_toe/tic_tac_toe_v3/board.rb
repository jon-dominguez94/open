class Board
    def initialize(size=3)
        @grid = Array.new(size){Array.new(size, '_')}
        nil
    end

    def valid?(pos)
        row, col = pos
        return false if row < 0 || row >= @grid.length
        col >= 0 && col < @grid[0].length
    end

    def empty?(pos)
        row, col = pos
        @grid[row][col] == '_'
    end

    def place_mark(pos, mark)
        raise 'out of bounds' if !self.valid?(pos) || !self.empty?(pos)
        row, col = pos
        @grid[row][col] = mark
        mark
    end

    def print
        @grid.each do |row|
            line = "|"
            row.each {|el| line += el.to_s + "|"}
            puts line
        end
        nil
    end

    def win_row?(mark)
        @grid.any? {|row| row.all? {|el| el == mark}}
    end

    def win_col?(mark)
        trans = @grid.transpose
        trans.any? {|row| row.all? {|el| el == mark}}
        # (0...@grid[0].length).each do |j|
        #     row = []
        #     (0...@grid.length).each do |i|
        #         row << grid[i][j]
        #     end
        #     return true if row.all? {|el| el == mark}
        # end
        # false
    end

    def win_diagonal?(mark)
        self.check_left_diagonal(mark) || self.check_right_diagonal(mark)

    end

    def check_left_diagonal(mark)
        (0...@grid.length).each do |i|
            return false if @grid[i][i] != mark
        end
        true
    end

    def check_right_diagonal(mark)
        (0...@grid.length).each do |i|
            j = @grid.length - 1 - i
            return false if @grid[i][j] != mark
        end
        true
    end

    def win?(mark)
        self.win_row?(mark) || self.win_col?(mark) || self.win_diagonal?(mark) 
    end

    def empty_positions?
        @grid.any? {|row| row.any? {|spot| spot == '_'}}
    end

    def legal_positions
        positions = []
        (0...@grid.length).each do |i|
            (0...@grid.length).each do |j|
                pos = [i,j]
                positions << pos if self.empty?(pos)
            end
        end
        positions
    end
end
