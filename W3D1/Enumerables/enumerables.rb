require "byebug"
class Array

    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i+=1
        end
        self
    end

    def my_select(&prc)
        selected = []
        self.my_each {|ele| selected << ele if prc.call(ele)}
        selected
    end

    def my_reject(&prc)
        rejected = []
        self.my_each {|ele| rejected << ele if !prc.call(ele)}
        rejected
    end 

    def my_any?(&prc)
        self.my_each {|ele| return true if prc.call(ele)}
        false
    end

    def my_all?(&prc)
        self.my_each {|ele| return false if !prc.call(ele)}
        true
    end

    
    def my_flatten
        flattened = []
        
        # debugger
        self.each do |ele| 
            if ele.class != Array
                flattened << ele
            else
                flattened += ele.my_flatten 
            end
        end
        flattened
    end

    def my_zip(*arrays)
        i = 0
        zipped = []

        while i < self.length 
            small_array = [self[i]]
            arrays.each do |arr| 
                small_array << arr[i]
            end
            zipped << small_array
            i+=1
        end
        zipped
    end

    def my_rotate(num=1)
        rotated = []
        self.each {|ele| rotated << ele}
        num.abs.times do
            if num > 0
                rotated << rotated.shift
            else
                rotated.unshift(rotated.pop)
            end
        end
        rotated
    end

    def my_join(separator = "")
        joined = self[0].to_s
        i = 1
        while i < self.length
            joined += separator + self[i]
            i+=1
        end
        joined
    end

    def my_reverse
        reversed = Array.new(self.length)
        self.each.with_index do |ele, i|
            reversed[-i - 1] = ele
        end
        reversed
    end




end

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]


# p a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
# p [].my_join("$")

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]



# p a = [ 4, 5, 6 ]
# p b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# p c = [10, 11, 12]
# p d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

#p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# p a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]



# a = [1, 2, 3]
# a.my_select { |num| num > 1 } # => [2, 3]
# a.my_select { |num| num == 4 } # => []



# # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#     puts num
#    end.my_each do |num|
#     puts num
#    end
#    # => 1
#     #    2
#     #    3
#     #    1
#     #    2
#     #    3
   
#    p return_value  # => [1, 2, 3]