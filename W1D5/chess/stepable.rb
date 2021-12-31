module Stepable
  def moves
    moves = []
    move_diffs.each do |move|
      x = @position[0] + move.first
      y = @position[1] + move.last
      if @board.valid_pos?(x, y) && @board[[x, y]].color != self.color
        moves << [x, y]
      end
    end
    moves
  end

  private

  def move_diffs; end
end
