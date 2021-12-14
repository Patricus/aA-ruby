require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    moves = node.children
    moves.reject! { |move| move.losing_node?(mark) }
    raise 'We didn\'t play perfectly' if moves.empty?
    the_move = moves.find { |move| move.winning_node?(mark) }
    the_move = moves.sample if !the_move
    the_move.prev_move_pos
  end
end

if __FILE__ == $PROGRAM_NAME
  puts 'Play the brilliant computer!'
  hp = HumanPlayer.new('Jeff')
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
