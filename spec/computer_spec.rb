require 'computer'

describe Computer do

  let(:id) {"id"}
  let(:board) {double(:board)}
  let(:computer) {described_class.new(id, board)}

  it "has an id property" do
    expect(computer.id).to eq id
  end

  it "has a board property" do
    expect(computer.board).to eq board
  end

end
