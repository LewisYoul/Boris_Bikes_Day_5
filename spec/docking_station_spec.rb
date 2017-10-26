require 'docking_station'

describe DockingStation do
 station = DockingStation.new
   it { is_expected.to respond_to(:release_bike) }

   it 'gets a bike' do
     expect(station.release_bike).to be_an_instance_of(Bike)
   end

   it 'responds to dock' do
     expect(station).to respond_to(:dock)
   end

   it 'respond to docked_bikes' do
     expect(station).to respond_to(:docked_bikes)
   end

   it 'checks if dock receives one argument' do
     expect(station).to respond_to(:dock).with(1).argument
   end

  it "checks if station.docked_bikes is eq to a Bike" do
    test_bike = Bike.new
    station.dock(test_bike)
    p "here!!!!!", station.docked_bikes
    expect(station.docked_bikes).to eq(test_bike)
  end

   it 'checks that station.docked_bikes is an instance_of Bike'do
     bike = Bike.new
     station.dock(bike)
     expect(station.docked_bikes).to be_an_instance_of(Bike)
   end

end
