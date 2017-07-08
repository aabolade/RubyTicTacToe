require 'human'

describe Human do

  let(:human) {described_class.new("id")}

  it "has an id property" do
    expect(human.id).not_to eq nil
  end

  it "inherits from the Player class" do
    expect(human.class.superclass).to eq Player
  end
end
