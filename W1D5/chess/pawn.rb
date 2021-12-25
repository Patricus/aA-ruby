require_relative 'piece.rb'

class Pawn < Piece
  def symbol
    self.color == :white ? "\u2659".encode('utf-8') : "\u265F".encode('utf-8')
  end

  def moves
    moves = []
    move << [@position.first + forward_dir * 2, @position.last] if at_start_row?
    moves + forward_steps + side_attacks
  end

  private

  def at_start_row?
    self.color == :white && @position.first == 6 ||
      self.color == :black && @position.first == 1
  end

  def forward_dir
    self.color == :white ? -1 : 1
  end

  def forward_steps
    [@position.first + forward_dir, @position.last]
  end

  def side_attacks
    attacks = []
    move = forward_steps
    if @board[[move.first, move.last - 1]].color != self.color
      move << [move.first, move.last - 1]
    end
    if @board[[move.first, move.last + 1]].color != self.color
      move << [move.first, move.last + 1]
    end
  end
end
