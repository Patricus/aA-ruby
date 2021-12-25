require_relative 'piece.rb'
require_relative 'null_piece.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'

class Board
  def initialize
    @NullPiece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) { @NullPiece } }
    setup
  end

  def setup
    place_queens
    place_rooks
    place_knights
  end

  def place_queens
    black_queen = Queen.new(:black, self, [0, 3])
    @rows[0][3] = black_queen
    white_queen = Queen.new(:white, self, [7, 3])
    @rows[7][3] = white_queen
  end

  def place_rooks
    black_left_rook = Rook.new(:black, self, [0, 0])
    @rows[0][0] = black_left_rook
    black_right_rook = Rook.new(:black, self, [0, 7])
    @rows[0][7] = black_right_rook
    white_left_rook = Rook.new(:white, self, [7, 0])
    @rows[7][0] = white_left_rook
    white_right_rook = Rook.new(:white, self, [7, 7])
    @rows[7][7] = white_right_rook
  end

  def place_knights
    black_left_knight = Piece.new(:black, self, [0, 1])
    @rows[0][1] = black_left_knight
    black_right_knight = Piece.new(:black, self, [0, 6])
    @rows[0][6] = black_right_knight
    white_left_knight = Piece.new(:white, self, [7, 1])
    @rows[7][1] = white_left_knight
    white_right_knight = Piece.new(:white, self, [7, 6])
    @rows[7][6] = white_right_knight
  end

  def [](position)
    @rows[position[0]][position[1]]
  end

  def []=(position, value)
    @rows[position[0]][position[1]] = value
  end

  def move_piece(color, start_pos, end_pos)
    raise "No piece at #{start_pos}" if self[start_pos] == @NullPiece

    if !(0...8).to_a.include?(end_pos[0]) || !(0...8).to_a.include?(end_pos[1])
      raise "#{end_pos} is not a valid move"
    end

    piece = self[start_pos]

    if piece.moves.include?(end_pos)
      piece, self[end_pos] = self[end_pos], piece
    else
      puts "#{piece} to #{end_pos} is an invalid move!"
    end

    piece.pos = end_pos
  end

  # def valid_pos?(pos); end

  # def add_piece(piece, color); end

  # def checkmate?(color); end

  # def in_check?(color); end

  # def find_king(color); end

  # def pieces; end

  # def dup; end

  # def move_piece!(color, start_pos, end_pos); end
end

b = Board.new
puts b[[0, 3]]
puts b[[4, 7]]
b.move_piece(:black, [0, 3], [4, 0])
puts b[[4, 0]]
b.move_piece(:black, [0, 3], [4, 3])
puts b[[4, 3]]
puts b[[0, 0]]
