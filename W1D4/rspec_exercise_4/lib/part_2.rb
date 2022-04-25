def proper_factors (num)
    (1...num).select{|i| num % i ==0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    num = 1
    perf_nums = []
    while perf_nums.length <n
        perf_nums<<num if perfect_number?(num)
        num+=1
    end
    perf_nums
end