require "byebug"

def bad_two_sum?(arr, target) #O(n^2)
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if i < j && arr[i] + arr[j] == target
                return true
            end
        end
    end
    return false
end


# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6)  == true # => should be true
# p bad_two_sum?(arr, 10) == false # => should be false

def okay_two_sum?(arr, target)
    sorted_arr = arr.sort
    left_idx = 0
    right_idx = arr.length - 1
    while left_idx < right_idx
        compare = arr[left_idx] + arr[right_idx] <=> target
        if compare == 0
            return true
        elsif compare == -1
            left_idx += 1
        else
            right_idx -= 1
        end
    end
    false
end

# arr = [0, 1, 5, 7]  # [6, 5, 1, -1]
# p okay_two_sum?(arr, 6)  == true # => should be true
# p okay_two_sum?(arr, 10) == false # => should be false

def two_sum?(arr, target)
    hash = Hash.new(false)
    arr.each do |el|
        el2 = target - el
        if hash[el2]
            return true
        end
        hash[el] = true
    end
    return false
end

arr = [0, 1, 5, 7]  # [6, 5, 1, -1]
p two_sum?(arr, 6)  == true # => should be true
p two_sum?(arr, 10) == false # => should be false