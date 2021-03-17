class Card

    attr_reader :revealed

    def initialize(value)
        @value = value
        @revealed = false
    end

    def value
        @revealed ? @value : '_'
    end

    def hide
        @revealed = false
    end

    def reveal
        @revealed = true
        @value
    end

    def ==(card)
        @value == card.value
    end

    def !=(card)
        @value != card.value
    end

end