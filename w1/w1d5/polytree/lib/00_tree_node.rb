require 'byebug'

# MAX_STACK_SIZE = 100
# tracer = proc do |event|
#   if event == 'call' && caller_locations.length > MAX_STACK_SIZE
#     fail "Probable Stack Overflow"
#   end
# end
# set_trace_func(tracer)

class PolyTreeNode
  attr_writer :children

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent
    @parent
  end

  def parent=(parent)
    return if @parent == parent

    if @parent
      @parent._children.delete(self)
    end
    @parent = parent
    @parent._children << self unless @parent.nil?
    self
  end

  def children
    @children.dup
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    child.parent = nil if child.parent.children.include?(child)
  end

  def value
    @value.dup
  end

  def dfs(target_value = nil)
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target_value = nil)
    arr = [self]
    until arr.empty?
      checking = arr.pop
      return checking if checking.value == target_value
      checking.children.each { |child| arr.unshift(child) }
    end
    nil
  end


  private

  def deep_dup(arr)
    arr.map{ |el| el.is_a?(Array) ? deep_dup(el) : el }
  #   copy = []
  #   arr.each do |el|
  #     # byebug
  #     copy << el.is_a?(Array) ? deep_dup(el) : el
  #   end
  #   copy
  end

  protected
  def _children
    @children
  end

end

tree = PolyTreeNode.new(10)
tree.children = [1,2,3,4,5,[1,2]]
