require_relative 'piece.rb'
require_relative 'slidable.rb'

class Queen < Piece
  include Slidable

  def symbol
    "\u2655".encode('utf-8')
  end

  private

  def move_dirs
    %i[horizontal diagonal]
  end
end
