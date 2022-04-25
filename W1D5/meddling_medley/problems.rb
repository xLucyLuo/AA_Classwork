require "byebug"

def duos (str)
    count = 0
    (0...str.length-1).each {|i| count+=1 if str[i] == str[i+1]}
    count
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, hash)
    sent.split(" ").map do |word|
        if hash.include?(word)
            hash[word]
        else
            word
        end
    end.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped (hash, v_chg, &k_chg)
    new_hash = {}

    hash.each{|k,v| new_hash[k_chg.call(k)]= v_chg.call(v)}

    new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters (str)
    count = Hash.new(0)

    str.each_char {|chr| count[chr]+=1}

    count.select {|k,v| v>2}.keys
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true (str)
    (0...str.length-2).each {|i| return true if str[i] == str[i+1] && str[i] == str[i+2]}
    false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
    str.each_char.map do |chr|
        if chr == " "
            chr
        elsif hash.include?(chr) 
            hash[chr]
        else
            "?"
        end
    end.join("")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress (str)
    #assumes number cannot be 2 digits
    new_str = ""
    i = 0

    while i < str.length
        #debugger
        new_str += str[i]*str[i+1].to_i
        i+=2
    end

    new_str
end
 
# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select(arr, *prcs)
    arr.select{|el| prcs.all?{|prc| prc.call(el)}}
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin (sent)
    sent.split(" ").map do |word|
        if word.length<3
            word
        else
            i_vowel = first_vowel_index (word)
            #debugger
            if i_vowel == 0
                word + "yay"
            else
                if word == word.capitalize 
                    (word[i_vowel..-1] + word[0...i_vowel] + "ay").capitalize
                else
                    (word[i_vowel..-1] + word[0...i_vowel] + "ay")
                end
            end
        end
    end.join(" ")
end

def first_vowel_index(word)
    vowels = "aeiou"
    (0...word.length).each {|i| return i if vowels.include?(word[i].downcase)}
    nil
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    sent.split(" ").map {|word| word.length<3 ? word : word_translate(word)}.join(" ")
end

def word_translate(word)
    i_last_vowel = last_vowel_index(word).to_i
    #debugger
    new_word = ""
    if i_last_vowel == word.length-1
        new_word = word*2
    else
        new_word = word+word[i_last_vowel..-1]
    end

    word == word.capitalize ? new_word.capitalize : new_word
end

def last_vowel_index(word)
    vowels = "aeiou"
    (0...word.length).each {|i| return word.length-(i+1) if vowels.include?(word[-(i+1)].downcase)}
    nil
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select (arr, *prcs)
    arr.select{|el| prcs.any?{|prc| prc.call(el)}}
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel (sent)
   sent.split(" ").each_with_index.map do |word, i| 
        i.even? ? vowel_index = first_vowel_index(word) : vowel_index = last_vowel_index(word)
        vowel_index.nil? ? word : word[0...vowel_index] + word[vowel_index+1..-1] 
   end.join(" ")
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)
    vowels = "aeiou"
    sent.split(" ").map do |word|
        if vowels.include?(word[-1].downcase)
            new_word = word + word[-1]
        else
            new_word = word.split("").map {|chr| vowels.include?(chr.downcase) ? chr + "b" + chr : chr}.join("")
        end

        word == word.capitalize ? new_word.capitalize : new_word
    end.join(" ")
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
    return str if str.length<2
    
    i_beg = 0
    i_end = 0
    new_str = ""

    (0...str.length).each do |i|
        #debugger
        if str[i] == str[i+1]
            i_end+=1
        else
            count = i_end - i_beg +1
            count = "" if count <2
            new_str+= str[i_beg] + count.to_s
            i_beg = i+1
            i_end = i_beg
        end
    end

    new_str
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"