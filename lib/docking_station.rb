class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    if @docked_bikes.empty?
      fail "no bikes in dock"
    else
      @docked_bikes
    end
  end

  def dock(arg)
    if @docked_bikes.length >= 20
      fail "twenty bikes already in dock"
    else
      @docked_bikes << arg
    end
  end

end
