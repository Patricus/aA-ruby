require_relative 'poly_tree_node.rb'

class KnightPathFinder
  def initialize(start_position)
    @start_position = start_position
    @root_node = PolyTreeNode.new(@start_position)
    build_move_tree
  end

  def self.valid_moves(position)
    up_left = [position.first - 2, position.last - 1]
    up_right = [position.first - 2, position.last + 1]
    right_up = [position.first - 1, position.last + 2]
    right_down = [position.first + 1, position.last + 2]
    down_right = [position.first + 2, position.last + 1]
    down_left = [position.first + 2, position.last - 1]
    left_down = [position.first + 1, position.last - 2]
    left_up = [position.first - 1, position.last - 2]

    moves = [up_left, up_right, right_up, right_down, down_right, down_left, left_down, left_up]

    # TODO more logic to check repeated positions
  end

  def build_move_tree
    # TODO build this method
  end
end
