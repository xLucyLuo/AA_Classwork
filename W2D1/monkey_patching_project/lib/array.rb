# Monkey-Patch Ruby's existing Array class to add your own custom methods
require "byebug"

class Array
    def span
        min = nil
        max = nil
        self.each do |el|
            if el.class == Integer || el.class == Float
                if min.nil? || el < min
                    min = el
                end

                if max.nil? || el > max
                    max = el
                end
            end 
        end

        if min.nil?
            nil
        else
            max - min
        end
    end

    def average
        return nil if self == []

        sum = 0.0
        count = 0
        self.each do |el|
            if el.class == Integer || el.class == Float
                    sum = sum + el
                    count += 1
            end
        end

        if count == 0
            nil
        else
           sum / count
        end
    end

    def median
        return nil if self == []

        self.sort!

        i_mid = (self.length-1) / 2
        if self.length.odd?
            self[i_mid]
        else
            (self[i_mid] + self[i_mid+1])/2.0
        end
    end

    def counts
        count = Hash.new(0)

        self.each{|el| count[el]+=1}

        count
    end

    def my_count (val)
        count = 0
        self.each {|el| count+=1 if val == el}
        count
    end

    def my_index (val)
        self.each_with_index{|el,i| return i if el == val}
        nil
    end

    def my_uniq
        uniq = []

        self.each {|el| uniq << el if !uniq.include?(el)}

        uniq
    end

    def my_transpose
        row = 0
        col = 0
        transposed = Array.new(self[0].length){Array.new(length)}
        #debugger
        while row < self.length
            col = 0
            while col <self[0].length
                transposed[col][row] = self[row][col]
                col +=1
            end
            row +=1
        end

        transposed
    end
end
