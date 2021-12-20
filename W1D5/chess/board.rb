class Board
  def initialize
    @rows = Array.new(8) { Array.new(8) }

    private

    @null_piece
  end

  def [](position)
    @rows[position[0]][position[1]]
  end

  def []=(position, value)
    @rows[position[0]][position[1]] = value
  end

  def move_piece(color, start_pos, end_pos)
    self[start_pos]
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
