require  'board'

describe Board do

  let(:board) {described_class.new}

  it "has an array of spaces" do
    expect(board.spaces.class).to eq Array
  end
end
