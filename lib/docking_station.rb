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
    if full?
      fail "twenty bikes already in dock"
    else
      @docked_bikes << arg
    end
  end

  def full?
    if @docked_bikes.length >= 20
      true
    else
      false
    end
  end

end
