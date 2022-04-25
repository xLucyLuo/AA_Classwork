require "byebug"

def partition (arr, num)
    new_arr = Array.new(2){Array.new(0)}

    arr.each do |el|
        if el < num
            new_arr[0] << el
        else
            new_arr[1] << el
        end
    end

    new_arr
end

def merge (hash1, hash2)
    merged = Hash.new()
    hash1.each {|k,v| merged[k]=v}
    hash2.each{|k,v| merged[k]=v}
    merged
end

def censor (sentence, arr)
    sentence.split{" "}.map{|word| censor_word(word,arr)}.join(" ")
end

def censor_word(word, arr)
    vowels = "aeiou"
    l_arr = arr.map{|str| str.downcase}
    if l_arr.include?(word.downcase)
        return word.split("").map do |chr| 
            if vowels.include?(chr.downcase)
                "*"
            else
                chr
            end
        end.join("")
    end
    word
end

def power_of_two? (num)
    #debugger
    remainder = 0
    while num >2
        num /= 2
        remainder = num % 2
    end

    if remainder == 0
        true
    else
        false
    end
end