require 'computer'

describe Computer do

  let(:id) {"X"}
  let(:opponent_id) {"O"}
  let(:board) {double(:board)}
  let(:computer) {described_class.new(id, board)}

  it "has an id property" do
    expect(computer.id).to eq id
  end

  it "has a board property" do
    expect(computer.board).to eq board
  end

  it "has a method to check whether the centre of the board is free" do
    expect(computer.board).to receive(:centre_grid_is_empty)
    computer.centre_grid_is_empty
  end

  it "assigns it's i.d to the centre if it is empty" do
    allow(board).to receive(:centre_grid_is_empty).and_return(true)
    expect(board).to receive(:assign_to_space).with(4,"X")
    computer.eval_board
  end

  it "can get the opponent id" do
    expect(computer.get_opponent_id).to eq opponent_id
  end

  describe "getting the best move" do
    xit "chooses the spot that wins the game" do
      allow(board).to receive(:available_spaces).and_return ["0","1","2","3","5","6","7","8"]
      allow(board).to receive(:spaces).and_return ["0","1","2","3","X","5","6","7","8"]
      expect(computer.get_best_move(board)).to eq 2
    end

    xit "chooses the spot that prevents the opponent winning the game" do
      game.board[0], game.board[4], game.board[3] = [game.hum,game.hum, game.com]
      expect(game.get_best_move(game.board)).to eq 8
    end
    #
    it "given an array of available positions, returns a random spot from the available positions" do
      available_spaces = ["1", "3", "5","6","8"]
      spot = computer.get_random_spot_from(available_spaces)
      expect(available_spaces.include?(spot.to_s)).to eq true
    end

  end

end
