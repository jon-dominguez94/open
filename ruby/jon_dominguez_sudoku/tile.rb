require 'colorize'

class Tile
    attr_accessor :value
    attr_reader :given

    def initialize(value)
        @value = value
        @given = value != 0
    end

    def render
        color = (@value == 0 ? :red : :blue)
        color = :green if @given
        @value.to_s.colorize(color)
    end
    
end