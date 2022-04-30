require_relative "list.rb"
require "byebug"
class TodoBoard
    def initialize
        @lists = Hash.new()
    end

    def get_command
        begin
            puts "Enter a command:"
            cmd, ls_label, *args = gets.chomp.split(" ")
            case cmd
            when "mktodo"
                @lists[ls_label].add_item(*args)
            when "up"
                @lists[ls_label].up(*args.map(&:to_i))
            when "down"
                @lists[ls_label].down(*args.map(&:to_i))
            when "swap"
                @lists[ls_label].swap(*args.map(&:to_i))
            when "sort"
                @lists[ls_label].sort_by_date!
            when "priority"
                @lists[ls_label].print_priority
            when "print"
                if args == []
                    @lists[ls_label].print 
                else
                    @lists[ls_label].print_full_item(args[0].to_i)
                end
            when "toggle"
                @lists[ls_label].toggle_item(args[0].to_i)
            when "rm"
                @lists[ls_label].remove_item(args[0].to_i)
            when "purge"
                @lists[ls_label].purge
            when "mklist"
                @lists[ls_label] = List.new(ls_label)
            when "ls"
                @lists.each do |label,list|
                    puts "- " + label
                end
            when "showall"
                @lists.each do |label,list|
                    list.print
                end
            when "quit"
                return false
            else
                puts "Sorry, command not recognized!"
            end

            true
        rescue 
            retry
    end

    def run
        while get_command
        end
    end
end

b = TodoBoard.new()
b.run
