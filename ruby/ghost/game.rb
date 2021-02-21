require 'set'
require_relative './player.rb'

class Game

    attr_reader :fragment, :losses

    def initialize(*players)
        @players = players
        @fragment = ""
        @dictionary = Set.new
        @current_player_index = 0
        @current_player = @players[@current_player_index]
        @previous_player = nil
        @losses = Hash.new(0)
    end

    def populate_dictionary(filename)
        # file = File.open("words.txt")
        # file.readlines.each {|line| @dictionary.add(line.chomp)}
        # file.close
        File.foreach(filename) {|line| @dictionary.add(line.chomp)}
    end

    def switch_player
        @current_player_index = (@current_player_index + 1) % @players.length
        @current_player, @previous_player = @players[@current_player_index], @current_player
        nil
    end

    def fragment_is_prefix?
        @dictionary.each do |word|
            return true if word.start_with?(@fragment)
        end
        false
    end

    def lose?
        @dictionary.include?(@fragment) || !self.fragment_is_prefix?
    end

    def game_over? 
        @players.length <= 1
        # @losses.values.any? {|total| total == 5}
    end

    def translate_losses(count)
        "GHOST"[0...count] + ("_" * (5 - count))
    end
    
    def print_scores
        @players.each do |player|
            puts player.name + ": " + self.translate_losses(@losses[player])
        end
    end
    
    def print_scoreboard
        puts "-----------------"
        puts "SCOREDBOARD"
        puts "-----------------"
        self.print_scores
    end
    
    def play_round
        puts "-----------------"
        puts "Fragment: " + @fragment
        puts @current_player.name + "'s turn!"
        @fragment += @current_player.get_guess
        self.switch_player
    end

    def reset_game
        @losses[@previous_player] += 1
        puts @previous_player.name + " loses the round!"
        puts "Fragment: " + @fragment
        @fragment = ""
    end

    def check_eliminations
        @losses.reject! do |k,v|
            condition = v >= 5
            if condition
                puts k.name + " is eliminated!"
                @players.delete(k)
            end
            condition
        end
        nil
    end
    
    def run
        until self.game_over?
            self.print_scoreboard
            self.play_round until self.lose?
            self.reset_game
            self.check_eliminations
        end

        puts @current_player.name + " wins the game!"
    end

end