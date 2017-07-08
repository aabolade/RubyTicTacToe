require 'computer'

describe Computer do

  let(:computer) {described_class.new("id")}

  it "has an id property" do
    expect(computer.id).to eq "id"
  end

end
