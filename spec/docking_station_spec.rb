require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  #  it 'gets a bike' do
  #    expect(station.release_bike).to be_an_instance_of(Bike)
  #  end
  describe "#dock" do
    it 'responds to dock' do
      station = DockingStation.new
      expect(station).to respond_to(:dock)
    end

    it 'checks if dock receives one argument' do
      station = DockingStation.new
      expect(station).to respond_to(:dock).with(1).argument
    end
  end
  describe "#docked_bikes" do

    it 'respond to docked_bikes' do
      station = DockingStation.new
      expect(station).to respond_to(:docked_bikes)
    end

    it "checks if station.docked_bikes is eq to a Bike" do
      station = DockingStation.new
      test_bike = Bike.new
      station.dock(test_bike)
      expect(station.docked_bikes).to eq(test_bike)
    end

    it 'checks that station.docked_bikes is an instance_of Bike'do
      station = DockingStation.new
      bike = Bike.new
      station.dock(bike)
      expect(station.docked_bikes).to be_an_instance_of(Bike)
    end

    it 'should raise an error if release_bike is requested and docked_bikes is empty' do
      station = DockingStation.new
      expect { station.release_bike }.to raise_error("no bikes in dock")
    end

    it "should raise an error if docked_bikes has one bike in" do
      station = DockingStation.new
      test_bike = Bike.new
      station.dock(test_bike)
      expect { station.dock(Bike.new) }.to raise_error("one bike already in dock")
    end

  end

end
