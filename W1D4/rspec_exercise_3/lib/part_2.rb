def element_count(arr)
    count = Hash.new(0)

    arr.each{|el| count[el]+=1}

    count
end

def char_replace!(str, hash)
    str.each_char.with_index do |chr,i|
        str[i] = hash[chr] if hash.include?(chr)
    end
    str
end

def product_inject (arr)
    arr.inject(1){|prod,num| prod*num}
end
