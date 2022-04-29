class Item
    attr_reader :title, :deadline, :description
    attr_writer :title, :description
    
    def self.valid_date?(date)
        #YYYY-MM-DD
        return false unless is_i?(date[0..3])
        return false unless is_i?(date[5..6]) && date[5..6].to_i > 0 && date[5..6].to_i <=12
        return false unless is_i?(date[-2..-1]) && date[-2..-1].to_i > 0 && date[-2..-1].to_i <=31
        return false unless chk_format = date[4] == "-" && date[7] == "-"
        true
    end

    def initialize(title, deadline, description)
        raise "not valid date" unless Item.valid_date?(deadline)

        @title = title
        @deadline = deadline
        @description = description
    end

    def deadline=(deadline)
        raise "not valid date" unless Item.valid_date?(deadline)
        @deadline = deadline
    end
end

def is_i?(str)
    return true if str.to_i != 0 
    str.to_i.to_s == str
end

# #my_item = Item.new('Fix login page', '2019-10-42', 'It loads slow.')
# #RuntimeError: deadline is not valid

# p my_item = Item.new('Fix login page', '2019-10-22', 'It loads slow.')
# #=> #<Item:0x
#         # @deadline="2019-10-22",
#         # @description="It loads slow.",
#         # @title="Fix login page">

# p my_item.title
# #=> "Fix login page"

# p my_item.description = 'It loads waaaaaay too slow!'
# #=> "It loads waaaaaay too slow!"

# p my_item
# #=> #<Item:0x
#         # @deadline="2019-10-22",
#         # @description="It loads waaaaaay too slow!",
#         # @title="Fix login page">

# #p my_item.deadline = "10-23-2019"
# #RuntimeError: deadline is not valid

# p my_item.deadline
# #=> "2019-10-22"

# p my_item.deadline = "2019-10-23"
# #=> "2019-10-23"

# p my_item.deadline
# #=> "2019-10-23"

# p my_item
# #=> #<Item:0x
#     # @deadline="2019-10-23",
#     # @description="It loads waaaaaay too slow!",
#     #  @title="Fix login page">


# p Item.new('Fix login page', '2019-10-25', 'The page loads too slow.')

# p Item.new(
#     'Buy Cheese',
#     '2019-10-21',
#     'We require American, Swiss, Feta, and Mozzarella cheese for the Happy hour!'
# )

# p Item.new(
#     'Fix checkout page',
#     '10-25-2019',
#     'The font is too small.'
# ) # raises error due to invalid date


# p Item.valid_date?('2019-10-25') # true
# p Item.valid_date?('1912-06-23') # true
# p Item.valid_date?('2018-13-20') # false
# p Item.valid_date?('2018-12-32') # false
# p Item.valid_date?('10-25-2019') # false