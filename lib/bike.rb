class Bike

  def initialize(working=true)
    @working = working
  end
  def working?
    true unless @working == false
  end

  def broken?
    true
  end

  def report_broken
    broken?
    @working = false
  end

end