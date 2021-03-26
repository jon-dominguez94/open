require_relative 'board.rb'

class Game

    def initialize(filename)
        @board = Board.from_file(filename)
    end
    
    def play
        until @board.won?
            pos = self.get_position
            val = self.get_value
            @board[pos] = val
        end
        puts "Board Solved!"
    end

    def get_position
        inp = nil
        until self.valid_input?(inp) 
            puts "Enter a valid position to change (ex: 2 0)"
            inp = gets.chomp
        end
        inp.split.map(&:to_i)
    end

    def get_value
    end

    def open_position?(pos)
        if @board[pos].given
            puts 'Given positions cannot be changed'
            return false
        end
        true 
    end

    def render
        @board.render
    end

    protected

    def valid_input?(inp)
        return false if inp.nil? || inp.split.length != 2
        inp.split.all? {|parts| ('0'..'8').to_a.include?(parts)}
    end

end