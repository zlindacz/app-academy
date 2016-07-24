require 'byebug'

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
  attr_accessor :list

  def initialize
    @sentinel = Link.new
    @sentinel.prev = @sentinel
    @sentinel.next = @sentinel
  end

  def [](key)
    @list.each { |link| return link if link.key == key }
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
    search_link = first

    until search_link == @sentinel
      return search_link.val if search_link.key == key
      search_link = search_link.next
    end

    nil
  end

  def include?(key)
    return true if get(key)
    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    new_link.next = @sentinel

    prev_link = @sentinel.prev
    prev_link.next = new_link

    @sentinel.prev = new_link
    new_link.prev = prev_link
  end

  def remove(key)
    return nil unless get(key)
    link_to_delete = first

    until link_to_delete == @sentinel

      if link_to_delete.key == key
        prev_link = link_to_delete.prev
        next_link = link_to_delete.next

        prev_link.next = next_link
        next_link.prev = prev_link
        link_to_delete.val = nil
        break
      end
      link_to_delete = link_to_delete.next
    end
  end

  def each
    values = []
    current_link = first
    until current_link == @sentinel
      byebug
      values << current_link.val
      current_link = current_link.next
    end
    values
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
