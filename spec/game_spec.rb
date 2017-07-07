require 'game'

describe Game do

  let(:game) {described_class.new}
  let(:board_string) {"0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"}
  let(:tie_board) {["X", "O", "X", "X","O","X","O","X","O"]}
  let(:no_tie_board) {["X","1","O","3","X","O","X","O","8"]}
  let(:winner) {["O","O","O","X","X","5","6","7","8"]}

  describe "displaying the board" do
    it "returns the state of the current board as a string" do
      expect(game.display_board).to eq board_string
    end
  end

  describe "ending the game" do
    it "displays a message to end the game" do
      expect(game.display_message_for_end_of_game).to eq "Game over"
    end
  end

  describe "playing the game" do
    it "allows the user to enter their move as long as the game is not over or tied" do
      expect(game).to receive(:get_human_spot).at_least(:once)
      game.run_game
    end
  end

  describe "checking for a free spot on the board" do
    it "assigns O to a space on the board if it is free" do
      game.assign_spot_if_space_free(4)
      expect(game.board).to eq ["0","1","2","3","O","5","6","7","8"]
    end

    it "does not assign O to space if it is not free" do
      game.board[4] = "X"
      game.assign_spot_if_space_free(4)
      expect(game.board).to eq ["0","1","2","3","X","5","6","7","8"]
    end

    it "throws an error if you try to assign spot outside bounds of board" do
      expect{game.assign_spot_if_space_free(10)}.to raise_error "this position is out of bounds"
    end
  end

  describe "checking for when the game is over" do
    it "returns true if either player has won the game" do
      expect(game.game_is_over(winner)).to eq true
    end

    it "returns false if there is no winner" do
      expect(game.game_is_over(board_string)).to eq false
    end
  end

  describe "checking for a tie" do
    it "returns true when a tie has occurs" do
      expect(game.tie(tie_board)).to eq true
    end

    it "returns false when there is not a tie" do
      expect(game.tie(no_tie_board)).to eq false
    end
  end

end
