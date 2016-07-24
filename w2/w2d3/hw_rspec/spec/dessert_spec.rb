require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
 Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:brownie) { Dessert.new("brownie", 100) }

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "tons") }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      brownie.add_ingredient("cacoa powder")
      expect(brownie.ingredients).to include("cacoa powder")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingred = ['sugar', 'cherries', 'coconut', 'milk', 'eggs']
      ingred.each { |el| brownie.add_ingredient(el) }
      expect(brownie.ingredients).to eq(brownie.ingredients)
      brownie.mix!
      expect(brownie.ingredients).to_not eq(ingred)
      expect(brownie.ingredients.sort).to eq(ingred.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(10)
      expect(brownie.quantity).to eq(90)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(120)}.to raise_error("not enough!")
    end
  end
end
