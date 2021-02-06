class HumanPlayer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        numbers = ('0'..'9').to_a
        
        puts @mark.to_s + "\'s turn!"

        while true
            puts 'Enter a valid position (Ex: 0 0): '
            inp = gets.chomp.split

            if inp.length != 2 || 
               inp.any? {|str| str.split("").any? {|ch| !numbers.include?(ch)}}
                puts "Invalid input. Please follow the example"
            else
                inp.map!(&:to_i)
                if !legal_positions.include?(inp)
                    puts "That position is not available. Try another"
                else
                    return inp
                end
            end
        end         
    end
end