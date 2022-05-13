require "tdd_programs.rb"
#require "rspec"


describe "#my_uniq" do
    it "removes duplicates from an array" do
        expect([1,2,1,3,3].my_uniq).to eq([1,2,3])
    end
end

describe "#two_sum" do
    it "returns an array of the indices of pairs that sum to 0" do
        expect([-1,0,2,-2,1].two_sum).to eq([[0,4],[2,3]])
    end
end

describe "#my_transpose" do
  it "returns a 2d array that is the the transpose of the original 2d array" do
    expect([
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]].my_transpose).to eq([[0, 3, 6],
                       [1, 4, 7],
                       [2, 5, 8]])
  end
end

describe "#stock_picker" do
  it "returns a pair of the days where buying and selling would be the most profitable" do
    expect([10, 1, 5, 4, 10].stock_picker).to eq([1, 4])
  end
end

describe TowersOfHanoi do
  subject(:tower){TowersOfHanoi.new}
  describe "#move" do
    context "with valid moves" do
      it "moves one number to another array/pile" do
        tower.move(0,1)
        expect(tower.left).to eq([4,3,2])
        expect(tower.mid).to eq([1])
        expect(tower.right).to be_empty
      end
    end
    context "with invalid moves" do
      it "raises an error if start tower is empty" do
        expect {tower.move(1, 2)}.to raise_error("nothing to move")
      end
    end
  end
  describe "#won?" do
    it "returns true if right array is full in the right order" do
      tower.move(0,1)
      tower.move(0,2)
      tower.move(1,2)
      tower.move(0,1)
      tower.move(2,0)
      tower.move(2,1)
      tower.move(0,1)
      tower.move(0,2)
      tower.move(1,2)
      tower.move(1,0)
      tower.move(2,0)
      tower.move(1,2)
      tower.move(0,1)
      tower.move(0,2)
      tower.move(1,2)
      expect(tower.won?).to eq(true)
    end
    it "returns false if right array is not full or in the right order" do
      expect(tower.won?).to eq(false)
    end
  end

end


