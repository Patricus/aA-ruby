require_relative 'piece.rb'
require_relative 'slidable.rb'

class Rook < Piece
  include Slidable

  def symbol
    "\u2656".encode('utf-8')
  end

  private

  def move_dirs
    [:horizontal]
  end
end
