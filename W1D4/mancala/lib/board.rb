class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = Array.new(14) { Array.new(4) { :stone } }
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !(0...14).to_a.include?(start_pos)
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    hand = @cups[start_pos]
    @cups[start_pos] = []
    position = start_pos
    while !hand.empty?
      position = (position + 1) % 14
      next if current_player_name == @name1 && position == 13
      next if current_player_name == @name2 && position == 6
      @cups[position] << hand.pop
    end
    render
    next_turn(position)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx] == [:stone]
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ''
    puts ''
  end

  def one_side_empty?
    @cups[0...6].all? { |cup| cup.empty? } ||
      @cups[7...13].all? { |cup| cup.empty? }
  end

  def winner
    victor = @cups[6] <=> @cups[13]
    case victor
    when 1
      return @name1
    when -1
      return @name2
    else
      return :draw
    end
  end
end
