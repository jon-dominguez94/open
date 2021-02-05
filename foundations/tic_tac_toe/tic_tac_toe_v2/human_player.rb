class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts @mark.to_s + "\'s turn!"
        puts 'Enter a valid position (Ex: 0 0): '

        numbers = ('0'..'9').to_a
        
        inp = gets.chomp.split
        raise "invalid input" if inp.length != 2 || inp.any? {|num| !numbers.include?(num)}
        
        inp.map(&:to_i)
    end
end