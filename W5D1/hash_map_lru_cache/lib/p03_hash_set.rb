class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    if count == num_buckets
      resize!
      self[num] << key
      @count+=1
    elsif !self.include?(key)
      self[num] << key
      @count+=1
    end
  end

  def include?(key)
    num = key.hash
    self[num].include?(key)
  end

  def remove(key)
    num = key.hash
    if self.include?(key)
      self[num].delete(key)
      @count-= 1
    end
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
