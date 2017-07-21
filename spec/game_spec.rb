require 'game'

describe Game do

  let(:player_1) {double(:player_1, :id => "id")}
  let(:player_2) {double(:player_2)}
  let(:player) {double(:player)}
  let(:players) {{player_1_type: player_1, player_1_id: 1, player_2_type: player_2, player_2_id: 2}}
  let(:interface) {double(:interface)}
  let(:board) {double(:board)}
  let(:game) {described_class.new(players, interface)}

  before do
    allow(player_1).to receive(:new).and_return(player)
    allow(player_2).to receive(:new).and_return(player)
    allow(player).to receive(:id)
  end

  it "has an interface property to take input from a human player" do
    expect(game.interface).not_to eq nil
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
      expect(game.player_2).to receive(:get_move)
      game.get_move_for(game.player_2)
    end

    it "assigns the current player after each move" do
      allow(player_1).to receive(:get_move)
      game.get_move_for(player_1)
      expect(game.current_player).to eq player_1.id
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

  describe "Game over message" do
    it "announces when there is a winner" do
      game.current_player = "X"
      allow(game).to receive(:winner_present).and_return(true)
      expect(game.display_message_for_end_of_game).to eq "Game over. X is the winner"
    end
  end

end
