require_relative "board.rb"

class Game

    def initialize
        @board = Board.new
        @last_guess = nil
    end
end