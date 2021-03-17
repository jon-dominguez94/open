require_relative "board.rb"

class Game

    def initialize(size=4)
        @board = Board.new(size)
        @board.populate
        @last_guess = nil
    end

    def play
        until @board.won?
            self.render
            self.make_guess(self.get_guess)
        end
    end

    def render
        system("clear")
        @board.render
        sleep(2)
    end
    
    protected

    def get_guess
        guess = nil
        until self.hidden_pos?(guess) 
            guess = self.get_input
        end
        guess
    end

    def get_input
        inp = nil
        until self.valid_input?(inp) 
            puts "Choose a position (Ex: 2,3)"
            inp = gets.chomp
        end
        inp.split(',').map(&:to_i)
    end

    def make_guess(pos)
        @board[pos].reveal
        self.render
        if @last_guess.nil?
            @last_guess = pos
        else
            self.compare_guesses(pos)
            @last_guess = nil
        end
    end

    def compare_guesses(pos)
        if @board[pos] != @board[@last_guess]
            [pos, @last_guess].each {|i| @board[i].hide}
        end
    end

    def valid_input?(guess)
        return false if guess.nil?
        parts = guess.split(',')
        return false if parts.length != 2
        parts.all? do |num|
            num.between?('0', (@board.size - 1).to_s)
        end
    end

    def hidden_pos?(pos)
        return false if !pos
        @board.hidden?(pos)
    end
end

if __FILE__ == $PROGRAM_NAME
    g = Game.new
    g.play
end