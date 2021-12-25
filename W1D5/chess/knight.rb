require_relative 'piece.rb'
require_relative 'stepable.rb'

class Knight < Piece
  include Stepable

  def symbol
    self.color == :white ? "\u2658".encode('utf-8') : "\u265E".encode('utf-8')
  end

  def move_diffs
    [[2, 1], [-2, 1], [1, 2], [-1, 2], [2, -1], [-2, -1], [1, -2], [-1, -2]]
  end
end
