class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  attr_accessor :list

  def initialize
    @sentinel = Link.new
    @sentinel.prev = @sentinel
    @sentinel.next = @sentinel
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @sentinel.next
  end

  def last
    @sentinel.prev
  end

  def empty?
    @sentinel.prev == @sentinel
  end

  def get(key)
    each do |link|
      break if link == @sentinel
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    return true if get(key)
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)

    prev_link = @sentinel.prev
    new_link.next = @sentinel
    new_link.prev = prev_link
    prev_link.next = new_link
    @sentinel.prev = new_link

    new_link
  end

  def remove(key)
    return nil unless get(key)

    each do |link|
      if link.key == key
        prev_link = link.prev
        next_link = link.next

        link.prev.next = next_link
        link.next.prev = prev_link
        link.prev, link.next = nil, nil
        return link.val
      end
    end
  end

  def each
    link = first
    until link == @sentinel
      yield link
      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
