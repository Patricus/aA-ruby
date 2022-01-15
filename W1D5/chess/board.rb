require_relative 'piece.rb'
require_relative 'null_piece.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'knight.rb'
require_relative 'pawn.rb'

class Board
  attr_reader :rows

  def initialize
    @NullPiece = NullPiece.instance
    @rows = Array.new(8) { Array.new(8) { @NullPiece } }
    setup
  end

  def setup
    place_kings
    place_queens
    place_rooks
    place_knights
    place_bishops
    place_pawns
  end

  def place_kings
    black_king = King.new(:black, self, [0, 4])
    @rows[0][4] = black_king
    white_king = King.new(:white, self, [7, 4])
    @rows[7][4] = white_king
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
    black_left_knight = Knight.new(:black, self, [0, 1])
    @rows[0][1] = black_left_knight
    black_right_knight = Knight.new(:black, self, [0, 6])
    @rows[0][6] = black_right_knight
    white_left_knight = Knight.new(:white, self, [7, 1])
    @rows[7][1] = white_left_knight
    white_right_knight = Knight.new(:white, self, [7, 6])
    @rows[7][6] = white_right_knight
  end

  def place_bishops
    black_left_knight = Bishop.new(:black, self, [0, 2])
    @rows[0][2] = black_left_knight
    black_right_knight = Bishop.new(:black, self, [0, 5])
    @rows[0][5] = black_right_knight
    white_left_knight = Bishop.new(:white, self, [7, 2])
    @rows[7][2] = white_left_knight
    white_right_knight = Bishop.new(:white, self, [7, 5])
    @rows[7][5] = white_right_knight
  end

  def place_pawns
    @rows[1].each_with_index do |pos, idx|
      pos = Pawn.new(:black, self, [1, idx])
      @rows[1][idx] = pos
    end
    @rows[6].each_with_index do |pos, idx|
      pos = Pawn.new(:white, self, [6, idx])
      @rows[6][idx] = pos
    end
  end

  def [](position)
    @rows[position[0]][position[1]] if valid_pos?(position.first, position.last)
  end

  def []=(position, value)
    @rows[position[0]][position[1]] = value if valid_pos?(
      position.first,
      position.last,
    )
  end

  def move_piece(color, start_pos, end_pos)
    raise "No piece at #{start_pos}" if self[start_pos] == @NullPiece

    if !valid_pos?(end_pos.first, end_pos.last)
      raise "#{end_pos} is not a valid move"
    end

    raise 'Wrong color!' if self[start_pos].color != color

    piece = self[start_pos]
    raise 'Moving into check!' if !piece.valid_moves

    if piece.moves.include?(end_pos)
      piece.pos = end_pos
      self[end_pos] = piece
      self[start_pos] = @NullPiece
    else
      raise "#{piece} to #{end_pos} is an invalid move!"
    end
  end

  def valid_pos?(x, y)
    [0, 1, 2, 3, 4, 5, 6, 7].include?(x) && [0, 1, 2, 3, 4, 5, 6, 7].include?(y)
  end

  def pieces(color)
    @rows.flatten.select { |piece| piece.color == color }
  end

  def checkmate?(color)
    if in_check?(color) &&
         pieces(color).all? { |piece| piece.valid_moves.empty? }
      return true
    end

    false
  end

  def in_check?(color)
    king_pos = find_king(color)
    @rows.each do |row|
      row.each do |piece|
        return true if piece.color != color && piece.moves.include?(king_pos)
      end
    end
    false
  end

  def find_king(color)
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        if piece.class == King && piece.color == color
          return row_index, col_index
        end
      end
    end
  end

  def dup
    board_copy = Board.new
    @rows.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        if @rows[row_index][col_index].class == NullPiece
          board_copy[[row_index, col_index]] = @NullPiece
        else
          board_copy[[row_index, col_index]] =
            piece.class.new(piece.color, board_copy, [row_index, col_index])
        end
      end
    end
    board_copy
  end

  def move_piece!(color, start_pos, end_pos)
    piece = self[start_pos]

    if piece.moves.include?(end_pos)
      piece.pos = end_pos
      self[end_pos] = piece
      self[start_pos] = @NullPiece
    end
  end
end
