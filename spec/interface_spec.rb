require 'interface'

describe Interface do

  let(:interface) {described_class.new}

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
