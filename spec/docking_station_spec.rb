require 'docking_station'
require 'bike'
class FakeBike
  def working?
    true
  end
end

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
      test_bike = double(:bike)
      station.dock(test_bike)
      expect(station.docked_bikes[0][0]).to eq(test_bike)
    end

    it 'checks that station.docked_bikes is an instance_of Bike'do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike)
      expect(station.docked_bikes.first).to eq([bike, true])
    end

    it 'should raise an error if release_bike is requested and docked_bikes is empty' do
      station = DockingStation.new
      expect { station.release_bike }.to raise_error("no bikes in dock")
    end

    it "should raise an error if docked_bikes is at DEFAULT_CAPACITY" do
      station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { station.dock(double(:bike)) }
      expect { station.dock(double(:bike)) }.to raise_error("twenty bikes already in dock")
    end

  end

  describe "#full" do

    it 'should return docked_bikes is full fail error when full? == true' do
      station = DockingStation.new
      DockingStation::DEFAULT_CAPACITY.times { station.dock(double(:bike)) }
      expect { station.dock(double(:bike)) }.to raise_error("twenty bikes already in dock")
    end

  end

  describe '#empty?' do

    it 'should release a bike when empty? is false' do
      station = DockingStation.new
      bike = double(:bike)
      station.dock(bike)
      expect(station.release_bike).to eq(bike)
    end

    it 'should raise error when empty? is true' do
      station = DockingStation.new
      expect { station.release_bike }.to raise_error("no bikes in dock")
    end
  end

  describe "#Magic Number" do

    it "should have a Default Value of 20" do
      expect(DockingStation::DEFAULT_CAPACITY).to eq 20
    end

  end

  describe "#capacity" do

    it "DockingStation should set a DEFAULT_CAPACITY of 20 to capacity, when no argument is given" do
      station = DockingStation.new
      expect(station.capacity).to eq(20)
    end

    it "DockingStation should except an integer argument for capacity" do
      station = DockingStation.new (50)
      expect(station).to respond_to(:capacity)
    end

  end

  describe "#release_bike" do

    it "should raise an error if all bikes are broken" do
      station = DockingStation.new
      bike = double(:bike)#false
      station.dock(bike)
      expect { station.release_bike }.to raise_error("no bikes in dock")
    end
  end

end
