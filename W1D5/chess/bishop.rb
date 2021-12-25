require_relative 'piece.rb'
require_relative 'slidable.rb'

class Bishop < Piece
  include Slidable

  def symbol
    self.color == :white ? "\u2657".encode('utf-8') : "\u265D".encode('utf-8')
  end

  private

  def move_dirs
    [:diagonal]
  end
end
