require "byebug"
class Array
    def my_uniq
        uniq = []
        self.each do |el|
            uniq << el if !uniq.include?(el)
        end
        uniq
    end

    def two_sum
        pairs = []
        len = self.length
        (0...len).each do |i|
            (i+1...len).each do |j|
                if self[i] + self[j] == 0
                    pairs << [i,j]
                end
            end
        end
        pairs
    end

    def my_transpose
      transpose = Array.new(self.length) {Array.new(self.length)}
      (0...self.length).each do |i|
        (0...self.length).each do |j|
           transpose[i][j] = self[j][i]
        end
      end
      transpose
    end

    def stock_picker
      best_i = 0
      best_j = 0
      profit = 0
      (0...self.length - 1).each do |i|
        (i + 1...self.length).each do |j|
          new_profit = self[j] - self[i]
          if new_profit > profit
            profit = new_profit
            best_i = i
            best_j = j
          end
        end
      end

      [best_i, best_j]
    end
end

class TowersOfHanoi
  attr_reader :left, :right, :mid

  def initialize
    @left = [4,3,2,1]
    @mid = []
    @right = []
    @towers = [@left, @mid, @right]
  end

  def move(start_tower, end_tower)
    start_tower = @towers[start_tower]
    end_tower = @towers[end_tower]

    raise "nothing to move" if start_tower.empty?
    raise "Tower is too full" if end_tower.length == 4

    if end_tower.empty? || start_tower[-1] < end_tower[-1]
      plate = start_tower.pop
      end_tower.push(plate)
    end
  end

  def won?
    @right == [4, 3, 2, 1]
  end
end
