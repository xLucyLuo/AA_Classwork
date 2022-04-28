require "byebug"

#General Problems

def no_dupes?(arr)
    arr.select{|el| arr.count(el)==1}
end

# # Examples
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).each.all?{|i| arr[i] != arr[i+1]}
end

# #Examples
# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    indices = Hash.new{|h,k| h[k] = []}
    str.each_char.with_index{|chr,i| indices[chr]<<i}
    indices
end

# # Examples
# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    #key = start index
    #value = length
    streak = Hash.new(0)
    count = 0

    (0..str.length).each do |i|
        if str[i-1] == str[i] || i == 0
            count+=1
        else 
            streak[i-count] += count
            count = 1
        end
    end

    pos_longest = streak.to_a.sort_by{|el| el[1]}.last
    str[pos_longest[0]...pos_longest[0]+pos_longest[1]]
end

# # Examples
# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    (2..num).any?{|factor| num % factor == 0 && prime?(factor) && prime?(num/factor)}
end

def prime?(n)
    return false if n <2
    (2...n).none?{|factor| n % factor == 0}
end    

# # Examples
# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to_a

    message.each_char.map do |chr|
        chr_idx = alphabet.index(chr)
        new_idx = (chr_idx + keys.first) % alphabet.length
        keys.rotate!
        alphabet[new_idx]
    end.join("")
end

# # Examples
# p vigenere_cipher("toerrishuman", [1]) == "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2]) == "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3]) == "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0]) == "ceerd"
# p vigenere_cipher("yawn", [5, 1]) == "dbbo"


def vowel_rotate(str)
    vowels = "aeiou"

    str_vowels = str.each_char.select{|chr|vowels.include?(chr)}
    str_vowels.rotate!(-1)

    str.each_char.map do |chr|
        if vowels.include?(chr)
            str_vowels.rotate!
            str_vowels.last
        else
            chr
        end
    end.join("")
end

# # Examples
# p vowel_rotate('computer') == "cempotur"
# p vowel_rotate('oranges') == "erongas"
# p vowel_rotate('headphones') == "heedphanos"
# p vowel_rotate('bootcamp') == "baotcomp"
# p vowel_rotate('awesome') == "ewasemo"


#Proc Problems

class String

    def select(&prc)
        prc||= Proc.new{|el| false}

        selected = ""
        self.each_char do |chr|
            selected+=chr if prc.call(chr)
        end
        selected
    end

    # # Examples
    # p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    # p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    # p "HELLOworld".select          # => ""

    def map!(&prc)
        self.each_char.with_index{|chr, i| self[i] = prc.call(chr,i)}
        self
    end
end

# # Examples
# word_1 = "Lovelace"
# word_1.map! do |ch| 
#     if ch == 'e'
#         '3'
#     elsif ch == 'a'
#         '4'
#     else
#         ch
#     end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#     if i.even?
#         ch.upcase
#     else
#         ch.downcase
#     end
# end
# p word_2        # => "DiJkStRa"


#Recursion Problems
def multiply(a,b)
    return 0 if b ==0

    abs_result = a.abs + multiply(a.abs,b.abs-1)

    #debugger
    abs_result *= -1 if (a<0 && b>=0) || (a>=0 && b<0)
    abs_result
end

## Examples
# p multiply(3, 5)   == 15
# p multiply(5, 3)   == 15
# p multiply(2, 4)   == 8
# p multiply(0, 10)  == 0
# p multiply(-3, -6) == 18
# p multiply(3, -6)  == -18
# p multiply(-3, 6)  == -18

def lucas_sequence(len)
    return [] if len == 0
    return [2] if len == 1
    return[2,1] if len == 2

    prev_seq = lucas_sequence(len-1)

    prev_seq << prev_seq[-1] + prev_seq[-2]
end

# # Examples
# p lucas_sequence(0)   == []
# p lucas_sequence(1)   == [2]    
# p lucas_sequence(2)   == [2, 1]
# p lucas_sequence(3)   == [2, 1, 3]
# p lucas_sequence(6)   == [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   == [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    return [num] if prime?(num)

    prime_factors = []
    (2..num).each do |n|
        if num % n == 0
            return prime_factors + prime_factorization(n) + prime_factorization(num/n)
        end
    end
end

# # Examples
# p prime_factorization(12)     == [2, 2, 3]
# p prime_factorization(24)     == [2, 2, 2, 3]
# p prime_factorization(25)     == [5, 5]
# p prime_factorization(60)     == [2, 2, 3, 5]
# p prime_factorization(7)      == [7]
# p prime_factorization(11)     == [11]
# p prime_factorization(2017)   == [2017]