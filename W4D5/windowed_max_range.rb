def windowed_max_range1(arr, w)
    current_max_range = nil
    (0...arr.length).each do |i|
        subarr = arr[i...i+w]
        min = subarr.min
        max = subarr.max
        if current_max_range == nil || max - min > current_max_range
            current_max_range = max-min
        end
    end
    return current_max_range
end

p windowed_max_range1([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range1([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range1([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range1([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue

    def initialize
        @store = []
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(ele)
        @store << ele
    end

    def dequeue
        @store.shift
    end
end

def MyStack
   
    def initialize
        @store = []
    end

    def peek
        @store[-1]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def push(ele)
        @store << ele
    end

    def pop
        @store.pop
    end
end

def StackQueue

    def initialize
        @in_stack = MyStack.new
        @out_stack = MyStack.new
    end


end