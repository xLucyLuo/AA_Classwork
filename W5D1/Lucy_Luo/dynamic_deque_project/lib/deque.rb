class Deque
    def initialize
        @concealed_array = []
    end

    def size
        @concealed_array.length
    end

    def blank?
        @concealed_array.empty?
    end

    def front
        @concealed_array[0]
    end

    def back
        @concealed_array[-1]
    end

    def push_back(item)
        @concealed_array << item
        size
    end

    def push_front(item)
        @concealed_array.unshift(item)
        size
    end

    def pop_back
        @concealed_array.pop
    end

    def pop_front
        @concealed_array.shift
    end
end