require 'human'

describe Human do

  let(:human) {described_class.new("id")}

  it "has an id property" do
    expect(human.id).not_to eq nil
  end

  it "inherits from the Player class" do
    expect(human.class.superclass).to eq Player
  end

  describe "getting a move" do

    it "gets an input from the user" do
      expect(human).to receive(:get_user_input)
      human.get_move
    end

    it "checks whether an input is valid" do
      expect(human).to receive(:is_invalid)
      human.get_move
    end

    describe "validating input" do
      it "calls a method on the interface property to validate the input" do
        input = "input"
        expect(human.interface).to receive(:validate).with(input)
        human.is_invalid(input)
      end
    end
  end

end
