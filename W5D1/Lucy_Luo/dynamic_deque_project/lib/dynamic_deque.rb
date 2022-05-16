class DynamicDeque < Deque
    attr_reader :max_volume

    def initialize(num)
        super()
        @max_volume = num
    end

    def middle
        return [] if blank?
        mid = size/2
        if size.even?
            @concealed_array[mid-1..mid]
        else
            [@concealed_array[mid]]
        end
    end

    def push_back(*items)
        raise "deque is full" if size + items.length > max_volume
        items.each{|item| super(item)} 
        size
    end

    def pop_front(n=1)
        removed = []
        n.times{removed << super()}
        removed
    end
end