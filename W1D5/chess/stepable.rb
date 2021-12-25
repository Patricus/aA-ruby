module Stepable
  def moves
    moves = []
    x = @position[0]
    y = @position[1]
    move_diffs.each do |move|
      x += move.first
      y += move.last

      if @board.valid_pos?(x, y) && @board[[x, y]].color != self.color
        moves << [x, y]
      end
    end
    moves
  end

  private

  def move_diffs; end
end
