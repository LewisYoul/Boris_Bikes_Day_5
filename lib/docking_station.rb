class DockingStation
  attr_reader :docked_bikes

  def release_bike
    if @docked_bikes != nil
      @docked_bikes
    else
      fail "no bikes in dock"
    end
  end

  def dock(arg)
    @docked_bikes = arg
  end

end
