class Bike
attr_reader :working

  def initialize (working = true)
    @working = working
  end

  def broken
      @working = false
  end

  def working?
    @working
  end

end
