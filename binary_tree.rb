class Node
  @value
  @left
  @right
  @parent

  attr_accessor :value, :left, :right, :parent

  def initialize(value = nil, left = nil, right = nil, parent = nil)
    @value = value
    @left = left
    @right = right
    @parent = parent
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
    self.overall_root = Node.new(array.shift)

    array.each do |value|
      build_tree_helper(Node.new(value), self.overall_root)
    end
  end

  def display(root = self.overall_root)
    # Recursive case: keep going in order while not leaf node.
    if !root.nil?
      display(root.left)
      puts root.value
      display(root.right)
    end
  end

  def breadth_first_search(target)
    root = self.overall_root
    q = [root]

    while !q.empty?
      return root if root.value == target

      if !root.left.nil?
        q << root.left
      end

      if !root.right.nil?
        q << root.right
      end

      root = q.shift
    end

    nil
  end

  def depth_first_search(target)
    root = self.overall_root
    s = [root]

    while !s.empty?
      return root if root.value == target

      if !root.left.nil?
        s.push(root.left)
      end

      if !root.right.nil?
        s.push(root.right)
      end

      root = s.pop
    end
  end

  def dfs_rec(target)
    dfs_helper(self.overall_root, target)
  end

  private

  def build_tree_helper(root, parent)
    return root if parent.nil?

    root.parent = parent

    if root.value < parent.value
      parent.left = build_tree_helper(root, parent.left)
    else
      parent.right = build_tree_helper(root, parent.right)
    end

    parent
  end

  def dfs_helper(root, target)
    if !root.left.nil?
      dfs_helper(root.left, target)
    end

    return root if root.value == target

    if !root.right.nil?
      dfs_helper(root.right, target)
    end
  end
end

tree = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
tree.display
target = tree.dfs_rec(6345)
puts target.value if !target.nil?
puts 'nil' if target.nil?
