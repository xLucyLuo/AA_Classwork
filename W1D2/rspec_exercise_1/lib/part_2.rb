def hipsterfy (word)
    vowels = "aeiouAEIOU"
    (1...word.length).each do |i|
        if vowels.include?(word[-i])
            word[-i]=""
            return word
        end
    end
    word
end

def vowel_counts(str)
    vowels = "aeiou"
    count_vowels = Hash.new(0)

    str.each_char{|chr| count_vowels[chr.downcase]+=1 if vowels.include?(chr.downcase)}

    count_vowels
end

def caesar_cipher (msg, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    msg.split("").map do |letter| 
        if alphabet.include?(letter)
            alphabet[(alphabet.index(letter)+num) % 26]
        else
            letter
        end
    end.join("")
end

