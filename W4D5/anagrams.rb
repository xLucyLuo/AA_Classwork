def anagram?(str1, str2)
    arr = generate_anagrams(str1)
    arr.include?(str2)
end

def generate_anagrams(str) #O(n * n!)
    return [str] if str.length == 1 
    arr = []
    prev = generate_anagrams(str[1..-1])
    prev.each do |subs|
        (0..subs.length).each do |i|
            arr << subs[0...i] + str[0] + subs[i..-1]
        end
    end
    arr
end

# p generate_anagrams("cat")
# p anagram?("gizmo", "sally") == false   #=> false
# p anagram?("elvis", "lives") == true   #=> true

def second_anagram?(str1, str2) # O(n^2) (O(nm))
    arr2 = str2.split("")
    str1.each_char do |chr|
        idx = arr2.index(chr)
        arr2.delete_at(idx) if idx != nil
    end
    arr2.empty?
end

# p second_anagram?("gizmo", "sally")    #=> false
# p second_anagram?("elvis", "lives")    #=> true

def third_anagram?(str1, str2) # O(n log n)
    arr1 = str1.split("")
    arr2 = str2.split("")
    arr1.sort == arr2.sort
end

# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2) #O(n)
    hash = Hash.new(0)

    str1.each_char do |chr|
        hash[chr]+=1
    end

    str2.each_char do |chr|
        hash[chr]-=1
    end

    hash.each_value do |val|
        return false if val != 0
    end
    
    return true
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true