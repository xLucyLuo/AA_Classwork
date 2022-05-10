class Array
  # Write an `Array#my_inject` method. If my_inject receives no argument, then
  # use the first element of the array as the default accumulator.
  # **Do NOT use the built-in `Array#inject` or `Array#reduce` methods in your 
  # implementation.**

  def my_inject(accumulator = nil, &prc)
    if !accumulator.nil?
      self.unshift(accumulator)
    end
    accumulator = prc.call(self[0],self[1])
    return accumulator if self.length<=2
    prev_arr = self[2..-1]
    
    prev_arr.my_inject(accumulator,&prc)
  end
end

# Define a method `primes(num)` that returns an array of the first "num" primes.
# You may wish to use an `is_prime?` helper method.

def is_prime?(num)
  return false if num <2
  (2...num).to_a.none?{|el| num % el == 0}
end

def primes(num)
  factor = 2
  primes = []
  while primes.length < num
    primes << factor if is_prime?(factor)
    factor +=1
  end
  primes
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  return [1] if num == 1
  return [1,1] if num == 2
  
  #factorials = [1,1]
  prev = factorials_rec(num - 1)
  prev << (num-1)*prev[-1]
end

class Array
  # Write an `Array#dups` method that will return a hash containing the indices 
  # of all duplicate elements. The keys are the duplicate elements; the values 
  # are arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    indices = Hash.new{|h,k| h[k] = []}
    self.each_with_index do |num, i|
      indices[num] << i if self.count(num) > 1
    end
    indices
  end
end

class String
  # Write a `String#symmetric_substrings` method that returns an array of 
  # substrings that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    return [] if self.length <=1
    palindromes = []
    i = 0
    while i < self.length
      j = i
      while j < self.length
        substr = self[i..j] 
        palindromes << substr if substr.is_palindrome? && substr.length > 1
        j+=1
      end
      i+=1
    end
    palindromes
  end

  def is_palindrome?
    mid = self.length/2
    counter = 0
    while counter <= mid
      return false if self[counter] != self[-counter-1]
      counter+=1
    end
    true
  end

end

class Array
  # Write an `Array#merge_sort` method; it should not modify the original array.
  # **Do NOT use the built in `Array#sort` or `Array#sort_by` methods in your 
  # implementation.**
  
  def merge_sort(&prc)
    return self if self.length <=1

    mid = self.length/2
    left = self[0...mid]
    right = self[mid..-1]
    Array.merge(left.merge_sort(&prc),right.merge_sort(&prc),&prc)
  end

  private
  def self.merge(left, right, &prc)
    sorted = []
    prc ||= Proc.new{|num1, num2| num1 <=> num2}
    
    until left.empty? || right.empty?
      compare = prc.call(left[0],right[0])
      if compare == -1
        sorted <<left.shift
      else
        sorted << right.shift
      end
    end
    
    sorted + left + right
  end
end
