class PolyTreeNode
  attr_reader :parent, :value, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent)
    return @parent = parent if parent == nil
    if !parent.children.include?(self)
      parent.children << self if parent != nil
      @parent.children -= [self] if @parent != nil
      @parent = parent
    end
  end

  def add_child(child)
    @children << child
    child.parent = (self)
  end

  def remove_child(child)
    raise 'Not a child' if !@children.include?(child)
    @children -= [child]
    child.parent = (nil)
  end

  def dfs(target_value)
    return self if self.value == target_value
    return nil if @children.empty?

    @children.each do |child|
      result = child.dfs(target_value)
      return result unless result == nil
    end
    nil
  end

  def bfs(target_value)
    search_array = []
    search_array << self
    until search_array.empty?
      return search_array.first if search_array.first.value == target_value
      search_array.first.children.each { |child| search_array << child }
      search_array.shift
    end
  end
end
