require 'human'

describe Human do

  let(:board) {double(:board)}
  let(:interface) {double(:interface)}
  let(:id) {double(:id)}
  let(:human) {described_class.new(id, board, interface)}

  it "has an id property" do
    expect(human.id).to eq id
  end

  it "has a board property" do
    expect(human.interface).to eq interface
  end

  it "has a board property" do
    expect(human.board).to eq board
  end

  describe "when input is valid and there is space on the board" do
    it "assigns the input to the board" do
      allow(human).to receive(:get_user_input).and_return("1")
      allow(human).to receive(:is_invalid).and_return(false)
      allow(human).to receive(:is_unavailable).and_return(false)
      allow(board).to receive(:assign_to_space)
      expect(human).to receive(:assign_to_board).with(1)
      human.get_move
    end

  end

  describe "validating input" do
    it "calls a method on the interface property to validate the input" do
      input = "input"
      expect(human.interface).to receive(:validate).with(input)
      human.is_invalid(input)
    end
  end

  describe "verifying if a spot is available" do
    it "calls a method on the board property to check whether a spot is available" do
      spot = "spot"
      allow(board).to receive(:is_available).with(spot)
      expect(human.board).to receive(:is_available).with(spot)
      human.is_unavailable(spot)
    end
  end

end
