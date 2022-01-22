require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double('chef') }

  describe '#initialize' do
    it 'sets a type' do
      dessert = Dessert.new('cake', 1, chef)
      expect(dessert.type).to eq('cake')
    end

    it 'sets a quantity' do
      dessert = Dessert.new('cake', 1, chef)
      expect(dessert.quantity).to eq(1)
    end

    it 'starts ingredients as an empty array' do
      dessert = Dessert.new('cake', 1, chef)
      expect(dessert.ingredients).to eq([])
    end

    it 'raises an argument error when given a non-integer quantity' do
      expect { dessert = Dessert.new('cake', 'one', chef) }.to raise_error(
        ArgumentError,
      )
    end
  end

  describe '#add_ingredient' do
    it 'adds an ingredient to the ingredients array' do
      dessert = Dessert.new('cake', 1, chef)
      dessert.add_ingredient('egg')
      expect(dessert.ingredients.last).to eq('egg')
    end
  end

  describe '#mix!' do
    it 'shuffles the ingredient array' do
      dessert = Dessert.new('cake', 1, chef)
      dessert.add_ingredient('egg')
      dessert.add_ingredient('milk')
      dessert.add_ingredient('sugar')
      dessert.mix!
      expect(dessert.ingredients).not_to eq(%w[egg milk sugar])
    end
  end

  describe '#eat' do
    it 'subtracts an amount from the quantity' do
      dessert = Dessert.new('cake', 3, chef)
      dessert.eat(2)
      expect(dessert.quantity).to eq(1)
    end

    it 'raises an error if the amount is greater than the quantity' do
      dessert = Dessert.new('cake', 3, chef)

      expect { dessert.eat(7) }.to raise_error(RuntimeError)
    end
  end

  describe '#serve' do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Bob the Great Baker')
      dessert = Dessert.new('cake', 3, chef)
      expect(dessert.serve).to include(chef.titleize)
    end
  end

  describe '#make_more' do
    it "calls bake on the dessert's chef with the dessert passed in" do
      dessert = Dessert.new('cake', 3, chef)
      allow(chef).to receive(:bake).with(dessert).and_return(400)
      expect(chef).to receive(:bake).with(dessert)
      chef.bake(dessert)
    end
  end
end
