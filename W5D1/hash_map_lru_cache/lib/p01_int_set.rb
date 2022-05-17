class MaxIntSet
  attr_reader :max, :store
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if num > max || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    return @store[num%num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if count == num_buckets
      resize!
      self[num] << num
      @count+=1
    elsif !self.include?(num)
      self[num] << num
      @count+=1
    end
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count-= 1
    end
  end
 
  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    return @store[num%num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    arr = []
    @store.each do |bucket|
      bucket.each do |el|
        arr << el
        self.remove(el)
      end
    end
    @store = @store + Array.new(@store.length){Array.new}
    arr.each do |el|
      self.insert(el)
    end
  end
end
