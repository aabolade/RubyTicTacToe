require 'human'

describe Human do

  let(:board) {double(:board)}
  let(:interface) {double(:interface)}
  let(:human) {described_class.new(interface, board, "id" )}

  it "has an id property" do
    expect(human.id).to eq "id"
  end

  describe "getting a move" do

    xit "gets an input from the user" do
      expect(human).to receive(:get_user_input)
      human.get_move
    end

    xit "checks whether an input is valid" do
      expect(human).to receive(:is_invalid)
      human.get_move
    end

    xit "checks whether the spot is available" do
      expect(human).to receive(:is_unavailable)
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
