require_relative 'bike'

class DockingStation
  attr_accessor :capacity
  def initialize(capacity=20)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    foundone = ""
    if !bikes.empty?
      bikes.each_with_index do |bike, index|
        if bike.working? == true
          foundone = bikes[index]
          bikes.delete_at(index)
        end
      end
    end
    if foundone == ""
      fail 'No bikes available'
    else
      foundone
    end
  end

  def dock bike
    fail 'Docking station full' if full?
    bikes << bike
  end

private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end