# Define your methods here. 

def first_letter_vowel_count(str)
    vowels = "aeiou"
    str.split(" ").select {|word| vowels.include?(word[0].downcase)}.length
end

def count_true (arr, prc)
    # count = 0
    # arr.each{|el| count+=1 if prc.call(el)}
    # count

    arr.count{|el| prc.call(el)}
end

def procformation (arr, prc1, prc2, prc3)
    arr.map do |el|
        if prc1.call(el)
            prc2.call(el)
        else
            prc3.call(el)
        end
    end
end

def array_of_array_sum (arrs)
    arrs.reduce(0){|sum,arr| sum + arr.sum}
end

def selective_reverse(sent)
    vowels = "aeiou"
    sent.split(" ").map do |word|
        if vowels.include?(word[0].downcase) || vowels.include?(word[-1].downcase) 
            word
        else
            word.reverse
        end
    end.join(" ")
end

def hash_missing_keys(hash, *arr)
    arr.select{|el| !hash.key?(el)}
end