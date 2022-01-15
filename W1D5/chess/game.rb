require_relative 'player.rb'
require_relative 'human_player.rb'
require_relative 'computer_player.rb'
require_relative 'display.rb'
require_relative 'board.rb'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {}
    player_setup(:white)
    player_setup(:black)
    @current_player = @players[:white]
  end

  def player_setup(color)
    begin
      system('clear')
      puts "Is #{color} player human (h) or computer (c)?"
      input = gets.chomp
      raise 'Not h or c' if !%w[h c].include?(input)
    rescue StandardError
      retry
    end
    if input == 'h'
      @players[color] = HumanPlayer.new(color, @display)
    else
      @players[color] = ComputerPlayer.new(color, @display)
    end
  end

  def play
    until @board.checkmate?(:white) || @board.checkmate?(:black)
      @display.render
      puts "#{@current_player.color}\'s turn"
      @current_player.make_move(@board)
      swap_turn!
    end
    if @board.checkmate?(:white)
      @display.render
      puts 'Black Wins!'
    else
      @display.render
      puts 'White Wins!'
    end
  end

  private

  def swap_turn!
    if @current_player == @players[:white]
      @current_player = @players[:black]
    else
      @current_player = @players[:white]
    end
  end
end

game = Game.new
game.play
