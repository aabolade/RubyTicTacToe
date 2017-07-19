require 'game'

describe Game do

  let(:player_1) {double(:player_1)}
  let(:player_2) {double(:player_2)}
  let(:player) {double(:player)}
  let(:players) {{player_1_type: player_1, player_1_id: 1, player_2_type: player_2, player_2_id: 2}}
  let(:interface) {double(:interface)}
  let(:game) {described_class.new(players, interface)}
  let(:board_string) {"0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"}
  let(:tie_board) {["X", "O", "X", "X","O","X","O","X","O"]}
  let(:no_tie_board) {["X","1","O","3","X","O","X","O","8"]}
  let(:winner) {["O","O","O","X","X","5","6","7","8"]}

  before do
    allow(player_1).to receive(:new).and_return(player)
    allow(player_2).to receive(:new).and_return(player)
    allow(player).to receive(:id)
  end

  it "has an interface property to take input from a human player" do
    expect(game.interface).not_to eq nil
  end

  describe "ending the game" do
    it "displays a message to end the game" do
      expect(game.display_message_for_end_of_game).to eq "Game over"
    end
  end

  describe "displaying the board" do
    it "calls the display method on the board object" do
      expect(game.board).to receive(:display)
      game.display_board
    end
  end

  describe "playing the game" do
    it "calls a method on player 1 to get its move" do
      expect(game.player_1).to receive(:get_move)
      game.get_move_for(game.player_1)
    end

    it "calls a method on player 2 to get its move" do
      p (game.player_2)
      expect(game.player_2).to receive(:get_move)
      game.get_move_for(game.player_2)
    end
  end

  describe "checking for a winner" do
    it "calls a method on the board" do
      expect(game.board).to receive(:is_winner)
      game.game_over_or_tie
    end
  end

  describe "checking for a tie" do
    it "calls a method on the board" do
      expect(game.board).to receive(:is_tie)
      game.game_over_or_tie
    end
  end

end
