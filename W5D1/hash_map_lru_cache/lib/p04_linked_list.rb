require "byebug"
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    @prev.next = self.next
    @next.prev = self.prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    #debugger
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @tail.prev == @head && @head.next == @tail
  end

  def get(key)
    current_node = @head
    while current_node.next != @tail
      current_node = current_node.next
      if current_node.key == key
        return current_node.val
      end
    end
  end

  def include?(key)
    current_node = @head
    while current_node.next != @tail
      current_node = current_node.next
      if current_node.key == key
        return true
      end
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    last.next = new_node
    new_node.prev = last
    @tail.prev = new_node
    new_node.next = @tail
    # new_node.prev = @tail
    # @tail = new_node
  end

  def update(key, val)
    current_node = @head
    while current_node.next != @tail
      current_node = current_node.next
      if current_node.key == key
        current_node.val = val
        return
      end
    end
  end

  def remove(key)
    current_node = @head
    while current_node.next != @tail
      current_node = current_node.next
      if current_node.key == key
        current_node.remove
        return
      end
    end
  end

  def each
    current_node = @head
    while current_node.next != @tail
      current_node = current_node.next
      yield current_node
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
