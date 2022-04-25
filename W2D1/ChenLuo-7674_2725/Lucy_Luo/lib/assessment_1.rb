# Define your methods here.

def string_map! (str, &prc)
    str.each_char.with_index {|chr, i| str[i] = prc.call(chr)}
    str
end

def three? (arr, &prc)
    arr.count{|el| prc.call(el)} == 3
end

def nand_select(arr, prc1, prc2)
    arr.select{|el| !prc1.call(el) || !prc2.call(el)}
end

def hash_of_array_sum (hash)
    hash.each_value.reduce(0){|sum, v| sum + v.sum}
end

def abbreviate (sent)
    sent.split(" ").map{|word| abbrev_word(word)}.join(" ")
end

def abbrev_word(word)
    vowels = "aeiou"
    return word if word.length <= 4
    word.split("").select{|chr| !vowels.include?(chr.downcase)}.join("")
end

def hash_selector(hash , *arr)
    return hash if arr.length == 0 
    hash.select {|k,v| arr.any?{|el| el == k}}
end