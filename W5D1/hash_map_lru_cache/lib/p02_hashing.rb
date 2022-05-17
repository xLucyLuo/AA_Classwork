class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    xor_result = ""
    self.each do |ele|
      if ele.is_a?(Integer)
        xor_result += ele.object_id.to_s(2)
      else
        xor_result += ele.to_sym.object_id.to_s(2)
      end
    end
    xor_result.to_i.hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
