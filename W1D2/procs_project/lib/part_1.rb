def my_map (arr, &prc)
    new_arr = []

    arr.each{|el| new_arr << prc.call(el)}

    new_arr
end

def my_select (arr, &prc)
    new_arr =[]

    arr.each{|el| new_arr << el if prc.call(el)}

    new_arr
end

def my_count (arr, &prc)
    count = 0

    arr.each{|el| count+=1 if prc.call(el)}

    count
end

def my_any? (arr, &prc)
    arr.reduce(false){|acc,el| acc || prc.call(el)}
end

def my_all? (arr, &prc)
    arr.reduce(true){|acc,el| acc && prc.call(el)}
end

def my_none? (arr, &prc)
    arr.reduce(true){|acc,el| acc && !prc.call(el)}
end