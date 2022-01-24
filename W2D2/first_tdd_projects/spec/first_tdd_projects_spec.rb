require 'first_tdd_projects'
require 'rspec'

describe First_tdd_projects do
  describe '#my_uniq' do
    it 'removes duplicates from an array' do
      tdd = First_tdd_projects.new
      expect(tdd.my_uniq([2, 2, 3, 4, 4])).to eq([2, 3, 4])
    end
  end
end

describe Array do
  describe '#two_sum' do
    it 'finds all the positions where the elements at those positions sum to zero' do
      two_sum_array = [-1, 0, 2, -2, 1]
      expect(two_sum_array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do
    it 'converts matrix from row oriented and column oriented' do
      matrix = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
      expect(matrix.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe '#stock_picker' do
    it 'takes an array and output pairs of profitable buy and sell days' do
      stock_prices = [12, 3, 14, 5, 2, 10]
      expect(stock_prices.stock_picker).to eq([[0, 2], [1, 2], [3, 5], [4, 5]])
    end
  end
end

describe Tower_of_Hanoi do
  subject(:tower_of_hanoi) { Tower_of_Hanoi.new }
  describe '#initialize' do
    it 'has three piles that can hold disks and all four disks stacked properly on the first pile' do
      expect(tower_of_hanoi.pile[0]).to eq([1, 2, 3, 4])
      expect(tower_of_hanoi.pile[2]).to eq([])
      expect(tower_of_hanoi.pile[1]).to eq([])
    end
  end
  describe '#select_pile' do
    it 'prompts the user to select a pile removing the disk from the pile' do
      tower_of_hanoi.select_pile(1)
      expect(tower_of_hanoi.pile[0]).to eq([1, 2, 3])
    end
    it 'places the selected rod into your hand' do
      tower_of_hanoi.select_pile(1)
      expect(tower_of_hanoi.hand).to eq(4)
    end
  end
end
