require './board.rb'
require './human_player.rb'

class Game
    def initialize(mark1, mark2)
        @board = Board.new
        @player1 = HumanPlayer.new(mark1)
        @player2 = HumanPlayer.new(mark2)
        @current_player = @player1
    end

    def switch_turn
        @current_player = (@current_player == @player1 ? @player2 : @player1)
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                puts mark.to_s + " wins!"
                return @board.print
            else
                self.switch_turn
            end
        end
        puts "DRAW"
    end
end

g = Game.new(:x, :O)
g.play