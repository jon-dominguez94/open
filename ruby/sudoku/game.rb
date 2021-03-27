require_relative 'board.rb'

class Game

    def initialize(filename)
        @board = Board.from_file(filename)
    end
    
    def play
        until @board.won?
            @board.render
            pos = self.get_open_position
            val = self.get_value
            @board[pos] = val
        end
        puts "Board Solved!"
    end

    protected

    def get_value
        val = nil
        until self.valid_value?(val) 
            puts "Enter a value to place in that position (1-9): "
            val = gets.chomp
        end
        val.to_i
    end

    def valid_value?(val)
        return false if val.nil?
        ('1'..'9').to_a.include?(val)
    end
    
    def valid_input?(inp)
        return false if inp.nil? || inp.split.length != 2
        inp.split.all? {|parts| ('0'..'8').to_a.include?(parts)}
    end

    def open_position?(pos)
        return false if pos.nil?
        if @board[pos].given
            puts 'Given positions cannot be changed'
            return false
        end
        true 
    end

    def get_position
        inp = nil
        until self.valid_input?(inp) 
            puts "Enter a valid position to change (ex: 2 0)"
            inp = gets.chomp
        end
        inp.split.map(&:to_i)
    end

    def get_open_position
        pos = nil
        until self.open_position?(pos)
            pos = self.get_position
        end
        pos
    end

end