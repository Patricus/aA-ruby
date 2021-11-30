class PolyTreeNode
  attr_reader :parent, :value
  attr_accessor :children

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
end
