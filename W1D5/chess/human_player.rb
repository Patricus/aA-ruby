require_relative 'player.rb'

class HumanPlayer < Player
  def turn_input
    input = []
    while input == []
      input = @display.cursor.get_input
      @display.render
      puts "#{self.color}\'s turn"
    end
    input
  end

  def make_move(board)
    start_pos = nil
    end_pos = nil

    begin
      start_pos = turn_input until start_pos != nil
      raise 'Wrong color!' if @display.board[start_pos].color != self.color
      end_pos = turn_input until end_pos != nil
      raise 'Start position equals end position' if start_pos == end_pos
      board.move_piece(@color, start_pos, end_pos)
    rescue RuntimeError
      start_pos = nil
      end_pos = nil
      @display.cursor.toggle_selected if @display.cursor.selected
      @display.render
      puts "#{self.color}\'s turn"
      retry
    end
    true
  end
end
