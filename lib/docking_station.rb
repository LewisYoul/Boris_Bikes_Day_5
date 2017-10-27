class DockingStation
  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    if empty?
      fail "no bikes in dock"
    elsif @docked_bikes.any? { |n| !n[1] == true }
      fail "no bikes in dock"
    else
      bike = @docked_bikes.find { |n| n[1] == true }
      @docked_bikes.delete(bike)
      bike[0]
    end
  end

  def dock(arg)
    if full?
      fail "twenty bikes already in dock"
    elsif arg.working? == true
      @docked_bikes << [arg, true]
    else
      @docked_bikes << [arg, false]
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
