require 'computer'

describe Computer do

  let(:computer) {described_class.new("id")}

  it "has an id property" do
    expect(computer.id).not_to eq nil
  end

  it "inherits from the Player class" do
    expect(computer.class.superclass).to eq Player
  end
end
