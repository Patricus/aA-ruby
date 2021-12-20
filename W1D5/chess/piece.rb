class Piece
  def initialize(color, board, position)
    @color = color
    @board = board
    @position = position
  end

  def to_s; end

  def empty?; end

  def valid_moves; end

  def pos=(val); end

  def symbol; end

  private

  def move_into_check?(end_pos); end
end
