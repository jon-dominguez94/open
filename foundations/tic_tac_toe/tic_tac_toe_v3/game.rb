require './board.rb'
require './human_player.rb'
require './computer_player.rb'

class Game
    def initialize(size, players)
        @board = Board.new(size)
        @players = []
        players.each do |k,v|
            @players << (v ? ComputerPlayer.new(k) : HumanPlayer.new(k))
        end
        @current_player = @players[0]
    end

    def switch_turn
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position(@board.legal_positions)
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

# g = Game.new(5, :X, :O, :S)
# g.play