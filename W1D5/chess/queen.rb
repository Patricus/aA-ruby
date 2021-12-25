require_relative 'piece.rb'
require_relative 'slidable.rb'

class Queen < Piece
  include Slidable

  def symbol
    self.color == :white ? "\u2655".encode('utf-8') : "\u265B".encode('utf-8')
  end

  private

  def move_dirs
    %i[horizontal diagonal]
  end
end
