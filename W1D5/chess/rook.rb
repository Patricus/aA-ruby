require_relative 'piece.rb'
require_relative 'slidable.rb'

class Rook < Piece
  include Slidable

  def symbol
    self.color == :white ? "\u2656".encode('utf-8') : "\u265C".encode('utf-8')
  end

  private

  def move_dirs
    [:horizontal]
  end
end
