require  'board'

describe Board do

  let(:board) {described_class.new}
  let(:board_string) {"1 | 2 | 3 \n===+===+===\n 4 | 5 | 6 \n===+===+===\n 7 | 8 | 9 \n"}

  describe "checking for available spaces" do
    it "returns true if a space is available" do
      expect(board.is_available(4)).to eq true
    end

    it "returns false if a space is unavailable" do
      board.assign_to_space("1","X")
      expect(board.is_available("1")).to eq false
    end

    it "returns false if the spot is outside the board" do
      expect(board.is_available("10")).to eq false
    end
  end

  describe "checking if the centre grid is empty" do
    it "returns true if the centre grid is empty" do
      expect(board.centre_grid_is_empty).to eq true
    end

    it "returns false if the centre grid is not empty" do
      board.assign_to_space("5","O")
      expect(board.centre_grid_is_empty).to eq false
    end
  end

  describe "displaying the board" do
    it "returns the state of the current board as a string" do
      expect(board.display).to eq board_string
    end
  end

  describe "collecting the available spots" do
    it "stores the available spots in an array" do
      board.assign_to_space("1","X")
      board.assign_to_space("2","X")
      board.assign_to_space("3","X")
      expect(board.available_spaces).to eq ["4","5","6","7","8","9"]
    end
  end

  describe "checking for when the game is over" do
    it "returns true if either player has won the game" do
      board.assign_to_space("1","X")
      board.assign_to_space("2","X")
      board.assign_to_space("3","X")
      expect(board.is_winner).to eq true
    end

    it "returns false if there is no winner" do
      expect(board.is_winner).to eq false
    end
  end

  describe "assigning a player to the board" do
    it "writes the id of the player to the space on the board" do
      board.assign_to_space("4", "X")
      expect(board.spaces).to eq ["1","2","3","X","5","6","7","8","9"]
    end
  end

  describe "checking for a tie" do
    it "returns true when a tie has occurs" do
      board.assign_to_space("1","O")
      board.assign_to_space("2","X")
      board.assign_to_space("3","X")
      board.assign_to_space("4","X")
      board.assign_to_space("5","O")
      board.assign_to_space("6","O")
      board.assign_to_space("7","O")
      board.assign_to_space("8","O")
      board.assign_to_space("9","X")
      expect(board.is_tie).to eq true
    end

    it "returns false when there is not a tie" do
      expect(board.is_tie).to eq false
    end
  end
end
