class Room
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    attr_reader :capacity, :occupants

    def full?
        occupants.length >= capacity
    end

    def available_space
        capacity - occupants.length
    end

    def add_occupant(person)
        if !full?
            @occupants << person
            return true 
        end 
        false
    end
end