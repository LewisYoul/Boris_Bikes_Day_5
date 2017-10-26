class DockingStation
  attr_reader :docked_bikes

  def release_bike
    Bike.new
  end

  def dock(arg)
    @docked_bikes = arg
  end

end
