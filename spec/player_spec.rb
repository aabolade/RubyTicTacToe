require 'player'

describe Player do

  let(:id) {"id"}
  let(:player) {described_class.new(id)}
  it "has an id property" do
    expect(player.id).not_to eq nil
  end

  it "instantiated with an id for a string" do
    expect(player.id).to eq id
  end
end
