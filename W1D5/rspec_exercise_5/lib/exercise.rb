require "byebug"

def zip (*arr)
    #arr.transpose
    new_arr = []
    (0...arr[0].length).each do |i|
        subarr = []
        (0...arr.length).each do |j|
            #debugger
            subarr << arr[j][i]
        end
        new_arr << subarr
    end
    new_arr
end

def prizz_proc(arr, prc1, prc2)
    arr.select{|el| (!prc1.call(el) && prc2.call(el)) ||  (prc1.call(el) && !prc2.call(el))}
end

def zany_zip (*arrays)
    new_arr = []
    repeat = true
    counter = 0
    while repeat
        repeat = false
        subarr = []
        (0...arrays.length).each do |i|
            repeat = true if !arrays[i][counter+1].nil?
            subarr << arrays[i][counter]
        end
        counter+=1
        new_arr<<subarr
    end
    new_arr
end

def maximum(arr, &prc)

    new_arr = arr.map{|el| prc.call(el)}

    max_index = new_arr.each_index.inject(0) do |max_i, i|
        if new_arr[i] >= new_arr[max_i]
            i
        else
            max_i
        end
    end

    arr[max_index]
end

def my_group_by(arr, &prc)
    hash = Hash.new{|h,k| h[k]=[]}

    arr.each {|el| hash[prc.call(el)] << el}

    hash
end

def max_tie_breaker (arr, prc, &blc)
    arr.each.inject do |max, el|
        #debugger
        if blc.call(el) > blc.call(max)
            el
        elsif blc.call(el) == blc.call(max)
            if prc.call(el) > prc.call(max)
                el
            else
                max
            end
        else
            max
        end
    end
end

def silly_syllables(sent)
    sent.split(" ").map{|word| silly_syllables_word(word)}.join(" ")
end

def silly_syllables_word(word)
    vowels = "aeiou"
    i_first_vowel = nil
    i_last_vowel = nil

    word.each_char.with_index do |chr,i|
        if vowels.include?(chr.downcase) 
            i_first_vowel = i if i_first_vowel==nil
            i_last_vowel = i
        end
    end

    #debugger
    return word if i_first_vowel == i_last_vowel
    word[i_first_vowel..i_last_vowel]
end