class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    temp = @store.dup
    temp.first
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end

class MyStack
  def initialize
    @store = []
    @max = 0
    @min = 0
  end

  def pop
    @store.pop
  end

  def push(el)
    @store.push(el)
    @max = el if el > @max
    @min = el if el < @min
  end

  def peek
    temp = @store.dup
    temp.last
  end

  def size
    @store.count
  end

  def empty?
    @store.empty?
  end

end

class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack2.push(el)
  end

  def dequeue
    (size-1).times { @stack2.push(@stack1.pop) }
    @stack1.pop
  end


  def size
    @stack1.count + @stack2.count
  end

  def empty?
    @stack1.empty?
  end
end
