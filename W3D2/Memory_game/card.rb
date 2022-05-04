class Card
    
    attr_reader :value, :face_up

    def initialize(value)
        @value = value
        @face_up = false
    end

    def hide
        @face_up = false
        return " "
    end

    def reveal
        @face_up = true
        return @value
    end

    def to_s
        if @face_up
            return @value
        else
            return " "
        end
    end

    def ==(card)
        if card.is_a?(Card)
            @value == card.value
        end
    end

end