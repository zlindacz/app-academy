require 'rspec'
require 'tdd'

describe "#remove_dups" do
  let(:array) { [1, 2, 1, 3, 3] }
  it "removes duplicates" do
    expect(remove_dups(array)).to eq([1, 2, 3])
  end
end

describe Array do
  describe "#two_sum" do
    let(:array) { [-1, 0, 2, -2, 1] }
    it "finds all pairs of indices in the array where values at those positions sum to zero" do
      expect(array.two_sum.sort).to eq([[0, 4], [2, 3]])
    end

    it "returns in dictionary order" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end
end


describe "my_transpose" do
  let(:matrix) {[ [0, 1, 2],
                  [3, 4, 5],
                  [6, 7, 8]]}
  it "makes rows into columns" do
    expect(my_transpose(matrix)[0]).to eq([0,3,6])
  end

  it "does not call the Array#transpose method" do
    expect(matrix).to_not receive(:transpose)
    my_transpose(matrix)
  end
end


describe "stock_picker" do
  let(:stock_prices) {[8,4,5,3,2,9,1]}

  it "outputs the most profitable pair" do
    expect(stock_picker(stock_prices)).to eq([4,5])
  end
  it "does not sell before buying" do
    low,high = stock_picker(stock_prices)
    expect(stock_prices.rindex(high)).to be > stock_prices.index(low)
  end
end









describe TowersOfHanoi do
  describe "#move" do
    subject(:game) {TowersOfHanoi.new}

    it "changes the towers after the move" do
      towers= game.towers
      game.move(1,0)
      expect(towers).not_to eq(TowersOfHanoi.new.towers)
    end


    it "throws an error when discs are placed out of order" do
      game.move(1,0)
      expect {game.move(1,0)}.to raise_error(MoveError)
    end
  end
  # describe move
  # some contexts
  #1 new array is not equal to original after move (check both arrays)
  #2 bigger number cannot go after/atop smaller number

  describe "#won?" do
    subject(:game) {TowersOfHanoi.new}
    it "holds discs in proper order" do
      expect(game.towers).to include([3, 2, 1])
    end

    it "holds discs on a tower that is different from starting tower" do
      dummy = game
      dummy.move(1, 0)
      dummy.move(1, 2)
      dummy.move(0, 2)
      dummy.move(1, 0)
      dummy.move(2, 1)
      dummy.move(2, 0)
      dummy.move(1, 0)
      expect(dummy.towers[1]).to be_empty
    end

  end
  # describe won?
  # some more contexts
  #1 all discs are in proper order
  #2 all discs are on a different array from the start array
end
