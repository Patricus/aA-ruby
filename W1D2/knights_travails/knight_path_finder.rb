require_relative 'poly_tree_node.rb'

class KnightPathFinder
  def initialize(start_position)
    @root_node = PolyTreeNode.new(start_position)
    @considered_positions = [start_position]
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

    moves.select { |move| (0...8).to_a.include?(move.first) && (0...8).to_a.include?(move.last) }
  end

  def new_move_positions(position)
    moves = KnightPathFinder.valid_moves(position)
    moves.select! { |move| !@considered_positions.include?(move) }
    @considered_positions += moves
    moves
  end

  def build_move_tree
    new_moves = [@root_node]
    until new_moves.empty?
      new_positions = new_move_positions(new_moves.first.value)
      new_positions.each do |position|
        position = PolyTreeNode.new(position)
        position.parent = new_moves.first
        new_moves << position
      end
      new_moves.shift
    end
  end

  def find_path(end_position)
    trace_path_back(@root_node.bfs(end_position))
  end

  def trace_path_back(end_position)
    path = [end_position]
    while path.first.parent != nil
      path.unshift(path.first.parent)
    end
    path.map(&:value)
  end
end

k = KnightPathFinder.new([0, 0])
p k.find_path([7, 6])
p k.find_path([6, 2])
