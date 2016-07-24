require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      if @count == num_buckets
        resize!
      end
      self[key] << key
      @count += 1
    end
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      @count -= 1
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  private

  def [](key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    cache = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    cache.each { |num| insert(num) }
  end
end
