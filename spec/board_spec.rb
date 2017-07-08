require  'board'

describe Board do

  let(:board) {described_class.new}
  let(:board_string) {"0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"}


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

  describe "displaying the board" do
    it "returns the state of the current board as a string" do
      expect(board.display).to eq board_string
    end
  end

  describe "checking for when the game is over" do
    it "returns true if either player has won the game" do
      board.assign_to_space(0,"X")
      board.assign_to_space(1,"X")
      board.assign_to_space(2,"X")
      expect(board.is_winner).to eq true
    end

    it "returns false if there is no winner" do
      expect(board.is_winner).to eq false
    end
  end

  describe "assigning a player to the board" do
    it "writes the id of the player to the space on the board" do
      board.assign_to_space(3, "X")
      expect(board.spaces).to eq ["0","1","2","X","4","5","6","7","8"]
    end
  end
end
