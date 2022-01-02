class Piece
  attr_reader :color
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def to_s
    return if self.class == NullPiece
    "#{@color.capitalize} #{self.class.name.split('::').last}"
  end

  def empty?
    return true if self.class == NullPiece
    false
  end

  def valid_moves
    self.moves.reject { |move| !move_into_check?(move) }
  end

  def pos=(val)
    @position = val
  end

  def symbol; end

  private

  def move_into_check?(end_pos)
    move_board = @board.dup
    piece = move_board[@position]
    move_board.move_piece!(@color, @position, end_pos)
    return false if move_board.in_check?(piece.color)
    true
  end
end
