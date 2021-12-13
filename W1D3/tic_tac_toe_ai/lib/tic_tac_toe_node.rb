require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return false if evaluator == @board.winner
    return false if self.children.all? { |child| child.board.tied? }
    if self.children.all? do |child|
         child.losing_node?(evaluator == :x ? :o : :x)
       end
      return false
    end

    true
  end

  def winning_node?(evaluator); end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    @board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |pos, pos_idx|
        next if @board[[row_idx, pos_idx]]
        new_board = @board.dup
        new_board[[row_idx, pos_idx]] = next_mover_mark
        children <<
          TicTacToeNode.new(
            new_board,
            next_mover_mark == :x ? :o : :x,
            [row_idx, pos_idx],
          )
      end
    end
    children
  end
end
