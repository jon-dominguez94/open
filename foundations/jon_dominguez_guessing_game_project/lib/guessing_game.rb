class GuessingGame
    def initialize(min, max)
        @secret_num = self.rand(min, max)
        @num_attempts = 0
        @game_over = false
    end

    def rand(min, max)
        rand = Random.new
        rand.rand(min..max)
    end

    def num_attempts
        @num_attempts
    end

    def game_over?
        @game_over
    end

    def check_num(num)
        @num_attempts += 1
        if num == @secret_num
            @game_over = true
            puts 'you win'
        elsif num > @secret_num
            puts 'too big'
        else
            puts 'too small'
        end
    end

    def ask_user
        puts 'enter a number'
        num = gets.chomp
        num = num.to_i
        self.check_num(num)
    end
end
