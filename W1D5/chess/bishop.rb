require_relative 'piece.rb'
require_relative 'slidable.rb'

class Bishop < Piece
  include Slidable

  def symbol
    "\u2657".encode('utf-8')
  end

  private

  def move_dirs
    [:diagonal]
  end
end
