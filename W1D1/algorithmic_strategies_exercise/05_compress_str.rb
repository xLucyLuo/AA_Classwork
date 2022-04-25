# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

require "byebug"

# def compress_str(str)
#     return str if str.length <2
#     new_str = str[0]
#     count = 1
#     (1...str.length).each do |idx|
#         if str[idx] == new_str[-1]
#             count +=1
#         else
#             if new_str.length <2
#                 new_str = count.to_s + new_str
#             else
#                 new_str[-1] = count.to_s + new_str[-1]
#             end
#             new_str += str[idx]
#             count = 1
#         end
#     end
#     new_str[-1] = count.to_s + new_str[-1]
#     new_str.gsub("1","")
# end

def compress_str (str)
    i_start = 0
    i_end = 0

    while i_end < str.length
        if str[i_end] == str[i_end+1]
            i_end +=1
        else
            count = i_end - i_start +1
            if count >1
                #debugger
                str[i_start..i_end] = count.to_s + str[i_start]
            end
            i_end = i_end - str[i_start..i_end].length + (count.to_s + str[i_start]).length + 1
            i_start = i_end
        end
    end
    str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
