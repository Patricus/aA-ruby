module Slidable
  HORIZONTAL_DIRS = [[-1, 0], [1, 0], [0, -1], [0, 1]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

  def horizontal_dirs
    moves = []
    HORIZONTAL_DIRS.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    moves
  end

  def diagonal_dirs
    moves = []
    DIAGONAL_DIRS.each do |dir|
      moves += grow_unblocked_moves_in_dir(dir[0], dir[1])
    end
    moves
  end

  def moves
    moves = []
    move_dirs.each do |dir|
      moves += horizontal_dirs if dir == :horizontal
      moves += diagonal_dirs if dir == :diagonal
    end
    moves
  end

  private

  def move_dirs; end

  def grow_unblocked_moves_in_dir(dx, dy)
    moves = []
    x = @position[0]
    y = @position[1]

    while (0...8).to_a.include?(x + dx) && (0...8).to_a.include?(y + dy) &&
            @board[[x + dx, y + dy]].empty?
      moves << [x + dx, y + dy]
      x += dx
      y += dy
    end
    moves
  end
end
