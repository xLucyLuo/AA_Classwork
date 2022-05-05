def itr_range(start, end_range)
    return [] if end_range < start

    arr_range = []
    
    (start...end_range).each do |num|
        arr_range << num
    end

    arr_range
end


# p itr_range(1, 5)
# p itr_range(5, 5)
# p itr_range(5, 4)

def rcsv_range(start, end_range)
    return [] if end_range <= start

    rcsv_range(start, end_range - 1) << end_range - 1
end

# p rcsv_range(1, 5)
# p rcsv_range(5, 5)
# p rcsv_range(5, 4)

def itr_sum(arr)
    sum = 0
    arr.each do |num|
        sum += num
    end
    sum
end

# p itr_sum([1, 2, 3, 4])

def rcsv_sum(arr)
    return arr[0] if arr.length == 1
    return 0 if arr.length == 0

    rcsv_sum(arr[0...-1]) + arr[-1]
end

# p rcsv_sum([1, 2, 3, 4])

def exp_easy(base, num) # 2,2 | 2, 1
    return 1 if num == 0 #return 1
    #raise "undefined" if base ==0 && num ==0
    base * exp_easy(base, num-1) # 2 * 1
end


# p exp_easy(0, 0) 
# p exp_easy(0, 1) 
# p exp_easy(1, 0) 
# p exp_easy(1, 1) 
# p exp_easy(1, 2) 
# p exp_easy(2, 1) 
# p exp_easy(2, 2) 

def exp_hard(base,num) #2, 2| 2, 1 | 2, 0
    return 1 if num == 0 # false | return 1
    #raise "undefined" if base ==0 && num ==0
    
    if num % 2 == 0 #true | # false
        exp = exp_hard(base, num/2) # exp (2,1)
        exp * exp
    else
        exp = exp_hard(base,(num-1)/2) #1
        base * exp * exp                      #1*1
    end
end

# p exp_hard(0, 0)
# p exp_hard(0, 1)
# p exp_hard(1, 0)
# p exp_hard(1, 1)
# p exp_hard(1, 2)
# p exp_hard(2, 1)
# p exp_hard(2, 2)

class Array

    def deep_dup
       self.map do |ele|
            if !ele.is_a?(Array)
                ele
            elsif ele.none? {|el| el.is_a?(Array)}
                ele.dup
            else
                ele.deep_dup
            end 
        end
    end 
end

# a = [1,[2],[3,[4]]]
# b = a.deep_dup
# p a
# p b
# p a.object_id
# p b.object_id
# p a[1]
# p b[1]
# p a[1].object_id
# p b[1].object_id
# p a[2][1]
# p b[2][1]
# p a[2][1].object_id
# p b[2][1].object_id

def fibonacci(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2

    fib = fibonacci(n-1)

    fib << fib[-1] + fib[-2]
end

# p fibonacci(3)
# p fibonacci(0)
# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(10)

def bsearch(arr, target)
    return nil if arr.empty? 
    mid = arr.length / 2   
    return mid if arr[mid] == target 
    left = arr[0...mid] 
    right = arr[mid + 1 ..-1] 
    if target < arr[mid] 
            return bsearch(left,target)
    else
        stack = bsearch(right,target)
        if stack
            return stack + left.length + 1
        else
            return nil
        end
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([1, 2, 3, 3, 4], 3) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.length == 1
    mid = arr.length/2
    left = arr[0...mid]
    right = arr[mid..-1]

    merge(merge_sort(left), merge_sort(right))
end

def merge (arr1, arr2)
    merged = []
    until arr1.empty? && arr2.empty?
        if arr1.empty?
            merged += arr2
            arr2 = []
        elsif arr2.empty?
            merged += arr1
            arr1 = []
        elsif arr1[0] < arr2[0]
            merged << arr1[0]
            arr1.shift
        else
            merged << arr2[0]
            arr2.shift
        end
    end
    merged
end

#p merge_sort([38,27,43,3,9,82,10])

def subsets(arr) #[1]
    return [[]] if arr.length == 0 #false
    prev = subsets(arr[0...-1]) #[[]]
    arr2 = prev.deep_dup #[[]]
    arr2.map!{|subarr| subarr << arr[-1]} #[[1]]
    prev += arr2 #[[]] + [[1]] = [[0],[1]]
end

# p subsets([])
# p subsets([1])
# p subsets([1,2,3])


def permutations(arr)
    return [[]] if arr.length == 0
    return [arr] if arr.length == 1
    prev = permutations(arr[0...-1])
    result = []
    prev.each do |subarr|
        i = 0
        while i < subarr.length + 1
            num = arr[-1]
            left = subarr[0...i]
            right = subarr[i..-1]
            result << left + [num] + right
            i +=1
        end
    end
    result
end

# p permutations([1,2,3])
# p permutations([1,2,3,4]).uniq
# p [1,2,3,4].permutation.to_a

def greedy_make_change(amount, coins = [25,10,5,1])
    return [] if amount == 0
    return nil if amount < 0

    biggest_possible_coin = coins.select {|coin| coin <= amount}.max
    [biggest_possible_coin] + greedy_make_change(amount - biggest_possible_coin, coins) 
end

# p greedy_make_change(24, [10,7,1])

def make_change(amount, coins = [25,10,5,1])
    
end