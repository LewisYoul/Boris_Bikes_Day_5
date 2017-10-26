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
      expect(station.docked_bikes).to eq([test_bike])
    end

    it 'checks that station.docked_bikes is an instance_of Bike'do
      station = DockingStation.new
      bike = Bike.new
      station.dock(bike)
      expect(station.docked_bikes.first).to be_an_instance_of(Bike)
    end

    it 'should raise an error if release_bike is requested and docked_bikes is empty' do
      station = DockingStation.new
      expect { station.release_bike }.to raise_error("no bikes in dock")
    end

    it "should raise an error if docked_bikes is at capacity of 20" do
      station = DockingStation.new
      20.times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error("twenty bikes already in dock")
    end

  end

  describe "#full" do

    it 'should respond to full?' do
      station = DockingStation.new
      expect(station).to respond_to(:full?)
    end

    it 'should return true when docked_bikes is full' do
      station = DockingStation.new
      20.times { station.dock(Bike.new) }
      expect(station.full?).to eq(true)
    end

    it 'should return false when docked_bikes is under capacity' do
      station = DockingStation.new
      expect(station.full?).to eq(false)
    end

    it 'should return docked_bikes is full fail error when full? == true' do
      station = DockingStation.new
      20.times { station.dock(Bike.new) }
      expect { station.dock(Bike.new) }.to raise_error("twenty bikes already in dock")
    end

    it 'should dock a bike if full? == false' do
      station = DockingStation.new
      station.dock(Bike.new)
      expect(station.docked_bikes.first).to be_an_instance_of(Bike)
    end

  end

  describe '#empty?'

    it 'should respond to the empty? method' do
      station = DockingStation.new
      expect(station).to respond_to(:empty?)
    end

    it 'should return true when empty? == true' do
      station = DockingStation.new
      expect(station.empty?).to eq(true)
    end

    it 'should return false when empty? == false' do
      station = DockingStation.new
      20.times { station.dock(Bike.new) }
      expect(station.empty?).to eq(false)
    end
end
