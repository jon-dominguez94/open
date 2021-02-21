class Player
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def get_guess
        alpha = ('a'..'z').to_a
        guess = ''
        while true
            p "Enter your guess letter: "
            guess = gets.chomp.downcase
            return guess if alpha.include?(guess)
            puts "Invalid guess"
        end
    end

end