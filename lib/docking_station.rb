class DockingStation
  attr_reader :docked_bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
  end

  def release_bike
    if empty?
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

  private
    def full?
      if @docked_bikes.length >= DEFAULT_CAPACITY
        true
      else
        false
      end
    end

    def empty?
      if @docked_bikes.empty?
        true
      else
        false
      end
    end

end
