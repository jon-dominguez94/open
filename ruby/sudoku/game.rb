require_relative 'board.rb'

class Game

    def initialize(filename)
        @board = Board.from_file(filename)
    end
    
end