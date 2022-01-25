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
  describe '#pick_up' do
    it 'takes a disk from selected a pile, removing the disk from the pile' do
      tower_of_hanoi.pick_up(1)
      expect(tower_of_hanoi.pile[0]).to eq([1, 2, 3])
    end
    it 'places the top disk of selected pile into your hand' do
      tower_of_hanoi.pick_up(1)
      expect(tower_of_hanoi.hand).to eq(4)
    end
  end
  describe '#put_down' do
    it 'places the disk in hand onto the selected pile' do
      tower_of_hanoi.pick_up(1)
      tower_of_hanoi.put_down(2)
      expect(tower_of_hanoi.pile[1]).to eq([4])
    end
    it 'removes the disk from your hand' do
      tower_of_hanoi.pick_up(1)
      tower_of_hanoi.put_down(2)
      expect(tower_of_hanoi.hand).to eq(nil)
    end
  end
  describe '#won?' do
    it 'checks to see if the last pile has all the disks in the right order' do
      tower_of_hanoi.pile[2] = [1, 2, 3, 4]
      expect(tower_of_hanoi.pile.last).to eq([1, 2, 3, 4])
    end
  end
  describe '#move' do
    before { allow(tower_of_hanoi).to receive(:gets).and_return('1', '3') }
    it 'prompts user to choose a pile to #pick_up and #put_down' do
      tower_of_hanoi.move
      expect(tower_of_hanoi.pile[0]).to eq([1, 2, 3])
      expect(tower_of_hanoi.pile[2]).to eq([4])
    end
  end
  describe '#play' do
    before do
      allow(tower_of_hanoi).to receive(:gets).and_return('1', '3')
      allow(tower_of_hanoi).to receive(:won?).and_return(false, true)
    end
    it 'checks if won? before each #move and stops if true' do
      expect(tower_of_hanoi).to receive(:won?).twice
      tower_of_hanoi.play
    end
  end
end
