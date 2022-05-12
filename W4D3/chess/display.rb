require_relative "board.rb"
require "colorize"
require_relative "cursor.rb"
require "byebug"
class Display
    attr_reader :cursor
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0],@board)
    end

    def render
        while true
            system("clear")
            @board.board.each_with_index do |arr, i| 
            temp = ""
            arr.each_with_index do |ele,j|
                #debugger
                if @cursor.cursor_pos == [i,j] && @cursor.selected == false
                    temp += " #{ele.sym} ".colorize(:background => :blue)
                elsif @cursor.cursor_pos == [i,j] && @cursor.selected == true
                    temp += " #{ele.sym} ".colorize(:background => :blue).on_yellow.blink
                else
                    temp += " #{ele.sym} ".colorize(:background => :red) if i.even? && j.even? || i.odd? && j.odd? 
                    temp += " #{ele.sym} ".colorize(:background => :black) if i.even? && j.odd? || i.odd? && j.even?
                end
                #temp += "|"
            end
            puts temp
            #puts "-------------------------------"
            end
            @cursor.get_input
            #return nil
        end
    end

    def cursor_in
        @cursor.get_input
    end

end