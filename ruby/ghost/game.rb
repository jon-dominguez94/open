require 'set'
require_relative './player.rb'

class Game

    attr_reader :fragment

    def initialize(player1, player2)
        # @players = players
        @player1 = player1
        @player2 = player2
        @fragment = ""
        @dictionary = Set.new
        @current_player = @player1
        @previous_player = @player2
        @losses = Hash.new(0)
    end

    def populate_dictionary(filename)
        # file = File.open("words.txt")
        # file.readlines.each {|line| @dictionary.add(line.chomp)}
        # file.close
        File.foreach(filename) {|line| @dictionary.add(line.chomp)}
    end

    def switch_player
        @current_player, @previous_player = @previous_player, @current_player
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
        @losses.values.any? {|total| total == 5}
    end

    def translate_losses(count)
        "GHOST"[0...count] + ("_" * (5 - count))
    end
    
    def print_scores
        puts @player1.name + ": " + self.translate_losses(@losses[@player1])
        puts @player2.name + ": " + self.translate_losses(@losses[@player2])
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
    
    def run
        until self.game_over?
            self.print_scoreboard
            self.play_round until self.lose?
            self.reset_game
        end

        puts @current_player.name + " wins the game!"
    end

end