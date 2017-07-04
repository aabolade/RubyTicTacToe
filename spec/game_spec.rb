require 'game'

describe Game do

  let(:game) {described_class.new}
  let(:board_string) {"0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"}

  describe "displaying the board" do
    it "returns the state of the current board as a string" do
      expect(game.display_board).to eq board_string
    end

  end

end
