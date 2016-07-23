class LRUCache
   def initialize(size)
     @size
     @cache = []
   end

   def count
     @cache.count
     # returns number of elements currently in cache
   end

   def add(el)
     if @cache.include?(el)
       @cache.delete(el)
     elsif count >= @size
       @cache.shift
     end
     @cache.push(el)
     # adds element to cache according to LRU principle
   end

   def show
     @cache.peek
     # shows the items in the cache, with the LRU item first
   end

   private

   def peek
     copy = @cache.dup
     peek = []
     until copy.empty?
       peek << copy.pop
     end
     peek
   end
   # helper methods go here!

 end

# right now is O(n)
# combine with hash structure for O(1)
