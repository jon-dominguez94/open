require 'colorize'

class Tile
    attr_reader :given, :value

    def initialize(value)
        @value = value
        @given = value != 0
    end

    def value=(num)
        raise 'Cannot change given values' if @given
        @value = num
    end

    def render
        color = (@value == 0 ? :red : :blue)
        color = :green if @given
        puts @value.to_s.colorize(color)
    end
    
end