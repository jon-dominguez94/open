require_relative "board.rb"

class Game

    def initialize
        @board = Board.new
        @last_guess = nil
    end

    def play
        until @board.won?
            @board.render
            self.make_guess(self.get_guess)
        end
    end

    protected

     def get_guess
        inp = nil
        until self.valid_guess?(inp) 
            puts "Choose a position (Ex: 2,3)"
            inp = gets.chomp
        end
        inp.split(',').map(&:to_i)
    end

    def make_guess(pos)
    end

    def valid_guess?(guess)
        return false if guess.nil?
        parts = guess.split(',')
        return false if parts.length != 2
        parts.all? do |num|
            num.between?('0', (@board.size - 1).to_s)
        end
    end
end