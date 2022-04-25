# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require "byebug"

def largest_prime_factor (num)
    factors_arr = factors(num)

    while factors_arr.length >0
        if is_prime?(factors_arr[-1])
            return factors_arr[-1]
        else
            factors_arr.pop
        end
    end
end

def is_prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        return false if num % factor == 0
    end
    true
end

def factors(num)
    factors_arr = []
    (1..num).each do |factor|
        factors_arr << factor if num % factor == 0 
    end
    factors_arr
end

def unique_chars?(str)
    count = Hash.new(0)

    str.each_char {|chr| count[chr]+=1}

    count.none? {|k,v| v>=2}
end

def dupe_indices (arr)
    indices = Hash.new{|h,k| h[k] = []}

    arr.each_with_index {|el, i| indices[el] << i }

    indices.each {|k,v| indices.delete(k) if v.length<2}

    indices
end

def ana_array (arr1, arr2)
    count_el(arr1) == count_el(arr2)
end

def count_el(arr)
    count = Hash.new(0)
    arr.each {|el| count[el]+=1}
    count
end
