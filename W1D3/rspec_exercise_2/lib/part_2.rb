def palindrome? (str)
    (0..str.length/2).each do |i|
        return false if str[i] != str[(i+1)*-1]
    end
    true
end

def substrings (str)
    i = 0
    j =0
    arr_substrings = []
    while i < str.length
        while j < str.length
            arr_substrings << str[i..j]
            j+=1
        end
        i +=1
        j=i
    end
    arr_substrings
end

def palindrome_substrings (str)
    substrings(str).select{|substr| palindrome?(substr) && substr.length>1}
end

