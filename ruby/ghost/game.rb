require 'set'
require_relative './player.rb'

class Game

    attr_accessor :dictionary, :current_player, :previous_player, :fragment

    def initialize(player1, player2)
        # @players = players
        @player1 = player1
        @player2 = player2
        @fragment = ""
        @dictionary = Set.new
        @current_player = @player1
        @previous_player = @player2
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

    def play_round
        puts @current_player.name + "'s turn!"
        @fragment += @current_player.get_guess
        self.switch_player
    end

    def run
        self.play_round until self.lose?
    end

end