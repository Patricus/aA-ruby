require_relative 'piece.rb'
require_relative 'null_piece.rb'

class Board
  def initialize
    @NullPiece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) { @NullPiece } }
    @rows[0].map! { |piece| piece = Piece.new(:black, self, 'test') }
  end

  def [](position)
    @rows[position[0]][position[1]]
  end

  def []=(position, value)
    @rows[position[0]][position[1]] = value
  end

  def move_piece(color, start_pos, end_pos)
    if !self[start_pos] || self[start_pos] = @NullPiece
      raise "No piece at #{start_pos}"
    end
    if !(0...8).to_a.include?(end_pos[0]) || !(0...8).to_a.include?(end_pos[1])
      raise "#{end_pos} is not a valid move"
    end

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]

    self[end_pos].pos = end_pos
  end

  def valid_pos?(pos); end

  def add_piece(piece, color); end

  def checkmate?(color); end

  def in_check?(color); end

  def find_king(color); end

  def pieces; end

  def dup; end

  def move_piece!(color, start_pos, end_pos); end
end
