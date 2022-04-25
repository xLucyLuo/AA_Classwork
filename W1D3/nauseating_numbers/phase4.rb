require "byebug"

def mersenne_prime(n)
    power_2 = 2
    i = 1
    #debugger
    while  i <= n
        power_2 *= 2
        i+=1 if prime?(power_2 - 1)
    end

    power_2-1
end

def prime?(n)
    return false if n<2
    (2...n).each {|div| return false if n % div ==0}
    true
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(str)
    triangular_num?(letter_sum(str))
end

def letter_sum (str)
    alphabet = ("a".."z").to_a
    str.each_char.reduce(0){|sum, chr| sum + alphabet.index(chr)+1}
end

def triangular_num? (n)
    (1..n).each do |i|
        triangular = (i*(i+1))/2 
        return false if triangular > n
        return true if triangular == n
    end

    false
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse (arr)
    i = 0
    while i + 1 < arr.length 
        if (arr[i]-arr[i+1]).abs == 1
            #debugger
            arr = arr[0...i]+arr[i+2..arr.length]
            i -=2
        end
        [i+=1,0].max
    end
    arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []
# p consecutive_collapse([1,1,4,5,2,2,3])              # [3]
# p consecutive_collapse([3,4])              # []

def pretentious_primes (arr, n)
    arr.map{|num| n_prime(num,n)}
end

def n_prime (num, n) # num = 4, 3, 2    n = -2    incr = -1    i = 1
    if n > 0 
        incr = 1
    else
        incr = -1
    end

    i = 0
    while i < n.abs
        return nil if num <2
        num += incr
        i+=1 if prime?(num)
    end

    num
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]