require_relative 'piece.rb'

class Pawn < Piece
  def symbol
    self.color == :white ? "\u2659".encode('utf-8') : "\u265F".encode('utf-8')
  end

  def moves
    moves = []
    if at_start_row?
      double_move = [@position.first + forward_dir * 2, @position.last]
      moves << double_move if @board[double_move].empty?
    end
    if @board.valid_pos?(forward_steps.first, forward_steps.last) &&
         @board[forward_steps].empty?
      moves << forward_steps
    end
    moves + side_attacks
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
    if @board.valid_pos?(move.first, move.last - 1) &&
         @board[[move.first, move.last - 1]].class != NullPiece &&
         @board[[move.first, move.last - 1]].color != self.color
      attacks << [move.first, move.last - 1]
    end
    if @board.valid_pos?(move.first, move.last + 1) &&
         @board[[move.first, move.last + 1]].class != NullPiece &&
         @board[[move.first, move.last + 1]].color != self.color
      attacks << [move.first, move.last + 1]
    end
    attacks
  end
end
