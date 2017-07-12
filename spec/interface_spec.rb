require 'interface'
require 'stringio'

describe Interface do

  let(:interface) {described_class.new}

  describe "starting the game" do
    it "calls the run_game from the game class" do
      expect(interface.game).to receieve(:run_game)
      interface.start
    end
  end

  describe "setting up the game" do
    it "provides options for user to select" do
      expect(interface).to receive(:game_options).at_least(:once)
      interface.ask_user_input
    end
  end

  describe "selecting the game for the user" do
     it "chooses the game computer vs computer for selecting '1'" do
       $stdin = StringIO.new("1")
       expect(interface).to receive(:human_human)
       interface.ask_user_input
       $stdin = STDIN
     end

     it "chooses the game computer vs computer for selecting '2'" do
       $stdin = StringIO.new("2")
       expect(interface).to receive(:computer_computer)
       interface.ask_user_input
       $stdin = STDIN
     end

     it "chooses the game computer vs computer for selecting '2'" do
       $stdin = StringIO.new("3")
       expect(interface).to receive(:human_computer)
       interface.ask_user_input
       $stdin = STDIN
     end
  end

  describe "validating user input" do
    it "is valid when input is a string integer" do
      input = "1"
      expect(interface.validate(input)).to eq false
    end

    it "is invalid when the input is a string of characters" do
      input = "invalid input"
      expect(interface.validate(input)).to eq true
    end

    it "is invalid when the input is a string of float" do
      input = "1.2"
      expect(interface.validate(input)).to eq true
    end

    it "is invalid when the input is a string of a negative integer" do
      input = "-3"
      expect(interface.validate(input)).to eq true
    end

  end


end
