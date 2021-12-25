require_relative 'piece.rb'
require_relative 'stepable.rb'

class King < Piece
  include Stepable

  def symbol
    self.color == :white ? "\u2654".encode('utf-8') : "\u265A".encode('utf-8')
  end

  def move_diffs
    [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
  end
end
