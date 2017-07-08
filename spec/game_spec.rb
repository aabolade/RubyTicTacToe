require 'game'

describe Game do

  let(:game) {described_class.new}
  let(:board_string) {"0 | 1 | 2 \n===+===+===\n 3 | 4 | 5 \n===+===+===\n 6 | 7 | 8 \n"}
  let(:tie_board) {["X", "O", "X", "X","O","X","O","X","O"]}
  let(:no_tie_board) {["X","1","O","3","X","O","X","O","8"]}
  let(:winner) {["O","O","O","X","X","5","6","7","8"]}

  xit "has two player properties that are children of the Player class" do
    players = [game.player_1, game.player_2]
    expect(players.all? { |player| player.class.superclass == Player }).to eq true
  end

  it "has an interface property to take input from a human player" do
    expect(game.interface).not_to eq nil
  end

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
    it "calls a method on player 1 to get its move" do
      expect(game.player_1).to receive(:get_move)
      game.get_move_for(game.player_1)
    end

    it "calls a method on player 2 to get its move" do
      expect(game.player_2).to receive(:get_move)
      game.get_move_for(game.player_2)
    end
  end

  describe "checking for a free spot on the board" do
    it "does not assign O to space if it is not free" do
      game.board[4] = "X"
      game.assign_spot_if_space_free(4,"O")
      expect(game.board).to eq ["0","1","2","3","X","5","6","7","8"]
    end

    it "assigns a spot with a specific player" do
      game.assign_spot_if_space_free(1,"X")
      expect(game.board).to eq ["0","X","2","3","4","5","6","7","8"]
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

  describe "evaluating the board" do
    it "assigns X to the centre if it is empty" do
      game.eval_board
      expect(game.board).to eq ["0","1","2","3","X","5","6","7","8"]
    end
  end

  describe "getting the best move" do
    it "chooses the spot that wins the game" do
      game.board[0], game.board[1] = [game.com,game.com]
      expect(game.get_best_move(game.board)).to eq 2
    end

    it "chooses the spot that prevents the opponent winning the game" do
      game.board[0], game.board[4], game.board[3] = [game.hum,game.hum, game.com]
      expect(game.get_best_move(game.board)).to eq 8
    end

    it "chooses a random spot out of the available spaces" do
      game.board[0], game.board[1], game.board[2] = [game.hum, game.com, game.hum]
      remaining_spots = [3,4,5,6,7,8]
      best_move = game.get_best_move(game.board)
      expect(remaining_spots.include?(best_move)).to eq true
    end

  end

end
