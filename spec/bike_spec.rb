require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  it "return a working bike" do
    bike = Bike.new
    expect(bike.working?).to be(true)
  end

  it "the bike is broken" do
    bike = Bike.new (false)
    expect(bike.working?).to be(false)
  end

end
