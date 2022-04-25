def is_prime?(num)
    return false if num<2
    (2...num).none?{|div| num % div == 0}
end

def nth_prime(n)
    counter = 1
    i = 2

    while counter < n
        i+=1
        counter+=1 if is_prime?(i)
    end

    i
end

def prime_range(min, max)
    (min..max).select{|n| is_prime?(n)}
end

