require 'interface'
require 'stringio'

describe Interface do

  let(:interface) {described_class.new}

  describe "selecting the game for the user" do
     it "chooses the game computer vs computer for selecting '1'" do
       $stdin = StringIO.new("1")
       expect(interface).to receive(:human_human)
       interface.present_game_options
       $stdin = STDIN
     end

     it "chooses the game computer vs computer for selecting '2'" do
       $stdin = StringIO.new("2")
       expect(interface).to receive(:computer_computer)
       interface.present_game_options
       $stdin = STDIN
     end

     it "chooses the game computer vs computer for selecting '2'" do
       $stdin = StringIO.new("3")
       expect(interface).to receive(:human_computer)
       interface.present_game_options
       $stdin = STDIN
     end
  end

 describe "selecting the symbol" do
   it "returns true when a valid symbol is chosen" do
     $stdin = StringIO.new("X")
     expect(interface.valid_symbol_selected).to eq(true)
   end

   it "returns false when a valid symbol is not chosen" do
     $stdin = StringIO.new("symbol")
     expect(interface.valid_symbol_selected).to eq(false)
   end

   it "continues to ask for a symbol until a valid symbol is chosen" do
     allow(interface).to receive(:valid_symbol_selected).and_return(false, false,true)
     expect(interface).to receive(:symbol_options).thrice
     interface.select_symbol
   end
 end

 describe "selecting player order" do
   it "returns true when a valid order option is chosen" do
     $stdin = StringIO.new("Y")
     expect(interface.valid_order_selected).to eq(true)
   end

   it "returns false when a valid order option is not chosen" do
     $stdin = StringIO.new("order")
     expect(interface.valid_order_selected).to eq(false)
   end

   it "continues to ask for a symbol until a valid symbol is chosen" do
     allow(interface).to receive(:valid_order_selected).and_return(false, false,true)
     expect(interface).to receive(:player_order_options).thrice
     interface.select_player_order
   end
 end

 describe "creating a game" do
   describe "for a human" do
     it "creates a game with the choices set by the user" do
       players = [{type: Human, id: "X"}, {type: Computer, id: "O" }]
       allow(interface).to receive(:symbol).and_return("X")
       allow(interface).to receive(:user_is_first).and_return(true)
       expect(interface.create_players(Human, Computer)).to eq players
     end
   end

   describe "for computer vs computer" do
     it "creates a game with default symbols for each player" do
       players = [{type: Computer, id: "X"}, {type: Computer, id: "O" }]
       expect(interface.create_players(Computer, Computer)).to eq players
     end
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
