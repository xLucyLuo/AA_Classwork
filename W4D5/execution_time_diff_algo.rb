def my_min (arr) #O(n^2)
    min = arr[0]
    arr.each_with_index do |el1, i|
        arr.each_with_index do |el2, j|
            if i < j && el2 < el1 && el2 < min
                min = el2
            end
        end
    end
    min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  ==  -5
list = [ -7, 3, 5, -4, -5, 10, 1, -6 ]
p my_min(list)  ==  -7

def my_min2(arr) # O(n)
    min = arr[0]
    arr.each do |el|
        if el < min
            min = el
        end
    end
    min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min2(list)  ==  -5
list = [ -7, 3, 5, -4, -5, 10, 1, -6 ]
p my_min2(list)  ==  -7

def largest_contiguous_subsum(arr) # O(n^3)
    subsums = []
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            subsums << arr[i..j].sum
        end
    end
    subsums.max
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) == 8 # => 8 (from [7, -6, 7])


def largest_contiguous_subsum2(arr) #O(n) time; #O(1) space
    current_sum = 0
    largest_sum = arr[0]

    arr.each do |el|
        current_sum += el 
        if largest_sum < current_sum
            largest_sum = current_sum
        elsif current_sum < 0
            current_sum = 0
        end
    end

    largest_sum
end

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) == 8 #(from [7, -6, 7])

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum2(list) == 8 #(from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum2(list) == -1 #(from [-1])

