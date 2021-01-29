class Board
    attr_reader :size

    def self.print_grid(grid)
        grid.each {|row| puts row.join(" ")}
    end

    def initialize(num)
        @grid = Array.new(num){Array.new(num, :N)}
        @size = num*num
    end

    def [](pos)
        row, col = pos[0..1]
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos[0..1]
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count {|el| el == :S}
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            true
        else
            self[pos] = :X
            false
        end
    end

    def place_random_ships
        count = 0
        size = @grid.length
        while count < @size / 4
            pos = [rand(0...size), rand(0...size)]
            if self[pos] == :N
                self[pos] = :S
                count += 1
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |loc|
                loc == :S ? :N : loc
            end
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end

end
