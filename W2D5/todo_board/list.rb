require_relative "item.rb"

class List
    attr_reader :label
    attr_writer :label


    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = "")
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title, deadline, description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(idx)
        return true if idx < self.size && idx >=0
        false
    end

    def swap(idx1, idx2)
        return false if !valid_index?(idx1) || !valid_index?(idx2)
        @items[idx1], @items[idx2] = @items[idx2], @items[idx1]
        true
    end

    def [](idx)
        return nil if !valid_index?(idx) 
        @items[idx]
    end

    def priority
        @items[0]
    end

    def print
        puts "-------------------------------------------------"
        puts @label.upcase.center(42, ' ')   
        puts "-------------------------------------------------"
        puts "Index | Item                 | Deadline   | Done"
        puts "-------------------------------------------------"

        @items.each_with_index do |item,i|
            puts i.to_s.ljust(6)+ "| " + item.title.ljust(21) + "| " + item.deadline + " | ["+(item.done ? "x" : " " )+"]"
        end
        puts "-------------------------------------------------"
    end

    def print_full_item(idx)
        return if !valid_index?(idx)
        puts "-------------------------------------------------"
        puts @items[idx].title.ljust(21) + @items[idx].deadline.rjust(21)+ "     ["+(@items[idx].done ? "x" : " " )+"]"
        puts @items[idx].description
        puts "-------------------------------------------------"
    end

    def print_priority
        self.print_full_item(0)
    end

    def up(idx,amt=1)
        return false if !valid_index?(idx)
        amt = [idx, amt].min
        while amt > 0
            swap(idx, idx-1) 
            amt-=1
            idx -=1
        end
        true
    end

    def down(idx,amt=1)
        return false if !valid_index?(idx)
        amt = [size-idx, amt].min
        while amt > 0
            swap(idx, idx+1) 
            amt-=1
            idx +=1
        end
        true
    end

    def sort_by_date!
        @items.sort_by!(&:deadline)
    end

    def toggle_item(idx)
        @items[idx].toggle
    end

    def remove_item(idx)
        return false unless valid_index?(idx)
        @items.delete_at(idx)
        true
    end

    def purge
        i = 0

        while i < @items.length
            if @items[i].done
                remove_item(i)
                i-=1
            end
            i+=1
        end
    end
end


#------------------------------------------------------------
# p l = List.new('Groceries')
# # => #<List:0x @items=[], @label="Groceries">

# p l.add_item('cheese', '2019-10-25')
# # => true

# p l.add_item('toothpaste', '2019-10-25')
# # => true

# p l.add_item('shampoo', '2019-10-24')
# # => true

# p l.add_item('candy', '2019-10-31')
# # => true

# p l.print
# # ------------------------------------------
# #                 GROCERIES
# # ------------------------------------------
# # Index | Item                 | Deadline
# # ------------------------------------------
# # 0     | cheese               | 2019-10-25
# # 1     | toothpaste           | 2019-10-25
# # 2     | shampoo              | 2019-10-24
# # 3     | candy                | 2019-10-31
# # ------------------------------------------
# # => nil

# p l.sort_by_date!
# # => [#<Item:0x @deadline="2019-10-24", @description="", @title="shampoo">,
# #  #<Item:0x @deadline="2019-10-25", @description="", @title="cheese">,
# #  #<Item:0x @deadline="2019-10-25", @description="", @title="toothpaste">,
# #  #<Item:0x @deadline="2019-10-31", @description="", @title="candy">]

# p l.print
# # ------------------------------------------
# #                 GROCERIES
# # ------------------------------------------
# # Index | Item                 | Deadline
# # ------------------------------------------
# # 0     | shampoo              | 2019-10-24
# # 1     | cheese               | 2019-10-25
# # 2     | toothpaste           | 2019-10-25
# # 3     | candy                | 2019-10-31
# # ------------------------------------------
# # => nil


#---------------------------------------------------------------------------------
# p l = List.new('Groceries')
# # => #<List:0x00007fac66bedf38 @items=[], @label="Groceries">

# p l.add_item('cheese', '2019-10-25')
# # => true

# p l.add_item('toothpaste', '2019-10-25')
# # => true

# p l.add_item('shampoo', '2019-10-24')
# # => true

# p l.add_item('candy', '2019-10-31')
# # => true

# p l.print
# # ------------------------------------------
# #                 GROCERIES
# # ------------------------------------------
# # Index | Item                 | Deadline
# # ------------------------------------------
# # 0     | cheese               | 2019-10-25
# # 1     | toothpaste           | 2019-10-25
# # 2     | shampoo              | 2019-10-24
# # 3     | candy                | 2019-10-31
# # ------------------------------------------
# # => nil

# p l.down(0)
# # => true

# p l.print
# # ------------------------------------------
# #                 GROCERIES
# # ------------------------------------------
# # Index | Item                 | Deadline
# # ------------------------------------------
# # 0     | toothpaste           | 2019-10-25
# # 1     | cheese               | 2019-10-25
# # 2     | shampoo              | 2019-10-24
# # 3     | candy                | 2019-10-31
# # ------------------------------------------
# # => nil

# p l.down(0, 2)
# # => true

# p l.print
# # ------------------------------------------
# #                 GROCERIES
# # ------------------------------------------
# # Index | Item                 | Deadline
# # ------------------------------------------
# # 0     | cheese               | 2019-10-25
# # 1     | shampoo              | 2019-10-24
# # 2     | toothpaste           | 2019-10-25
# # 3     | candy                | 2019-10-31
# # ------------------------------------------
# # => nil

# p l.up(3, 10)
# # => true

# p l.print
# # ------------------------------------------
# #                 GROCERIES
# # ------------------------------------------
# # Index | Item                 | Deadline
# # ------------------------------------------
# # 0     | candy                | 2019-10-31
# # 1     | cheese               | 2019-10-25
# # 2     | shampoo              | 2019-10-24
# # 3     | toothpaste           | 2019-10-25
# # ------------------------------------------
# # => nil

# p l.up(7, 3) # invalid index 7
# # => false

#----------------------------------------------------------------------------------------------
# p my_list = List.new('Groceries')
# # => #<List:0x @items=[], @label="Groceries">

# p my_list.size
# # => 0

# p my_list.add_item('cheese', '2019-10-25', 'Get American and Feta for good measure.')
# # => true

# p my_list.add_item('toothpaste', '2019-10-25')
# # => true

# p my_list.add_item('shampoo', '10-24-2019') # invalid date
# # => false

# p my_list.add_item('shampoo', '2019-10-24')
# # => true

# p my_list.add_item('candy', '2019-10-31', '4 bags should be enough')
# # => true

# p my_list
# # => #<List:0x
# #  @items=
# #   [#<Item:0x @title="cheese", @deadline="2019-10-25", @description="Get American and Feta for good measure.">,
# #    #<Item:0x @title="toothpaste", @deadline="2019-10-25", @description="">,
# #    #<Item:0x @title="shampoo", @deadline="2019-10-24", @description="">,
# #    #<Item:0x @title="candy", @deadline="2019-10-31", @description="4 bags should be enough">],
# #  @label="Groceries">

# p my_list.size
# # => 4

# p my_list.priority
# # => #<Item:0x @title="cheese", @deadline="2019-10-25", @description="Get American and Feta for good measure.">

# p my_list.swap(0,  2)
# # => true

# p my_list.priority
# # => #<Item:0x @title="shampoo", @deadline="2019-10-24", @description="">

# p my_list
# # => #<List:0x
# # @items=
# # #   [#<Item:0x @title="shampoo", @deadline="2019-10-24", @description="">,
# # #    #<Item:0x @title="toothpaste", @deadline="2019-10-25", @description="">,
# # #    #<Item:0x @title="cheese", @deadline="2019-10-25", @description="Get American and Feta for good measure.">,
# # #    #<Item:0x @title="candy", @deadline="2019-10-31", @description="4 bags should be enough">],
# # #  @label="Groceries">

#---------------------------------------------------------------------------------------------------
# p my_list.swap(1,  7) # invalid index 7
# # => false

# p my_list[1]
# # => #<Item:0x @title="toothpaste", @deadline="2019-10-25", @description="">

# p my_list[3]
# # => #<Item:0x @title="candy", @deadline="2019-10-31", @description="4 bags should be enough">

# p my_list.swap(1,  3)
# # => true

# p my_list[1]
# # => #<Item:0x @title="candy", @deadline="2019-10-31", @description="4 bags should be enough">

# p my_list[3]
# # => #<Item:0x @title="toothpaste", @deadline="2019-10-25", @description="">