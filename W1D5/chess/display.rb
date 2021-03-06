require_relative 'cursor.rb'
require_relative 'board.rb'
require 'colorize'

class Display
  BG_COLORS = %i[blue magenta green light_blue]
  attr_accessor :cursor
  attr_reader :board

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], @board)
  end

  def render
    system('clear')
    @board.rows.each_with_index do |row, row_index|
      line = ''
      row.each_with_index do |pos, pos_index|
        line +=
          (' ' + pos.symbol + '  ').colorize(
            color: pos.color,
            background: back_ground(row_index, pos_index),
          )
      end
      print line + "\n"
    end
    if @cursor.debug
      puts "#{@board[@cursor.cursor_pos]}"
      puts "White King pos:#{@board.find_king(:white)} - Black King pos:#{@board.find_king(:black)}"
      puts "White King check:#{@board.in_check?(:white)} - Black King check:#{@board.in_check?(:black)}"
      puts "Checkmate White: #{@board.checkmate?(:white)} - Checkmate Black: #{@board.checkmate?(:black)}"
    end
  end

  def back_ground(row_index, pos_index)
    return BG_COLORS[2] if @cursor.cursor_pos == [row_index, pos_index]
    if @cursor.selected &&
         @board[@cursor.selected].valid_moves.include?([row_index, pos_index])
      return BG_COLORS[1]
    end
    return BG_COLORS.first if row_index.even? == pos_index.even?
    BG_COLORS.last
  end
end
