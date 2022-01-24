class First_tdd_projects
  def my_uniq(array)
    my_array = []
    array.each do |element|
      if my_array.include?(element)
        next
      else
        my_array << element
      end
    end
    my_array
  end
end

class Array
  def two_sum
    zero_sum_array = []
    (0...self.length).each do |index1|
      (index1 + 1...self.length).each do |index2|
        zero_sum_array << [index1, index2] if self[index1] + self[index2] == 0
      end
    end
    zero_sum_array
  end

  def my_transpose
    new_matrix = []
    (0...self.length).each do |column|
      new_row = []
      (0...self.length).each { |row| new_row << self[row][column] }
      new_matrix << new_row
    end
    new_matrix
  end

  def stock_picker
    picked_pairs = []
    self.each_with_index do |buy_price, index|
      (index...self.length).each do |sell_index|
        if buy_price < self[sell_index]
          picked_pairs << [index, sell_index]
          break
        end
      end
    end
    picked_pairs
  end
end

class Tower_of_Hanoi
  attr_accessor :hand, :pile
  def initialize
    @pile = Array.new(3) { Array.new }
    @pile[0] = [1, 2, 3, 4]
    @hand = nil
  end

  def pick_up(selection)
    if [1, 2, 3].include?(selection.to_i)
      @hand = @pile[selection.to_i - 1].pop
      return true
    end
    false
  end

  def put_down(selection)
    if [1, 2, 3].include?(selection.to_i)
      @pile[selection.to_i - 1] << @hand
      @hand = nil
      return true
    end
    false
  end

  def won?
    return true if @pile.last == [1, 2, 3, 4]
    false
  end
end
