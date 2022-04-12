require 'rspec'
require 'dessert'
require 'byebug'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) {double('Dan')}
  let(:dessert) {Dessert.new('pudding', 100, chef)}
  let(:b_q) {Dessert.new('brownie', '100', chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('pudding')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {b_q.quantity}.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient('flour')
    end
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients.include?('flour')).to be true
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = [ 'chocolate', 'eggs', 'flour', 'milk' ]
      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
      expect(dessert.ingredients.sort).to eq(ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(50)
      expect(dessert.quantity).to eq(50)
    end

    it "raises an error if the amount is greater than the quantity"do
      expect {dessert.eat(101)}.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Dan the Great Baker')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
