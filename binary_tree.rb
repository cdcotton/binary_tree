class Node
  @value
  @left
  @right

  attr_accessor :value, :left, :right

  def initialize(value = nil, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def is_leaf?
    self.left.nil? && self.right.nil?
  end
end

class Tree
  @overall_root

  attr_accessor :overall_root

  def initialize(array)
    build_tree(array)
  end

  def build_tree(array)
    self.overall_root = build_tree_helper(array)
  end

  def display(root = self.overall_root)
    puts root.value
    # Recursive case: keep going while not leaf node.
    if !root.is_leaf?
      display(root.right)
    end
  end

  private

  def build_tree_helper(array)
    value = array[0]
    root = Node.new(value)
    # Recursive case where array is not empty.
    if !array.empty?
      root.right = build_tree_helper(array[1..-1])
    end
    root
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.display
