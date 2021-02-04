class Flight
    attr_reader :passengers

    def initialize(flight_number, capacity)
        @flight_number = flight_number.upcase
        @capacity = capacity
        @passengers = []
    end

    def full?
        @passengers.length >= @capacity
    end

    def board_passenger(passenger)
        @passengers << passenger if passenger.has_flight?(@flight_number) && !self.full?
    end
    
    def list_passengers
        @passengers.map{|pass| pass.name}
    end

    def [](idx)
        @passengers[idx]
    end

    def <<(pass)
        self.board_passenger(pass)
    end
end