require  'board'

describe Board do

  let(:board) {described_class.new}

  it "has an array of spaces" do
    expect(board.spaces.class).to eq Array
  end

  describe "checking for available spaces" do
    it "returns true if a space is available" do
      expect(board.is_available(4)).to eq true
    end

    it "returns false if a space is unavailable" do
      board.spaces[1] = "X"
      expect(board.is_available(1)).to eq false
    end

    it "returns false if the spot is outside the board" do
      expect(board.is_available(10)).to eq false
    end
  end

  describe "assigning a player to the board" do
    it "writes the id of the player to the space on the board" do
      board.assign_to_space(3, "X")
      expect(board.spaces).to eq ["0","1","2","X","4","5","6","7","8"]
    end
  end
end
