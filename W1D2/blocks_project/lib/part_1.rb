def select_even_nums (arr)
    arr.select(&:even?)
end

def reject_puppies (arr)
    arr.reject{|dog| dog["age"] <=2}
end

def count_positive_subarrays (arr)
    arr.count{|a| a.sum >0}
end

def aba_translate(word)
    vowels = "aeiou"
    word.split("").map do |chr|
        if vowels.include?(chr)
            chr+"b"+chr
        else
            chr
        end
    end.join("")
end

def aba_array(arr)
    arr.map{|word| aba_translate(word)}
end
