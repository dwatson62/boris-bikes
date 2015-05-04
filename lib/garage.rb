class Garage
  include BikeContainer

  def fix_bikes
    bikes.each { |x| x.fix }
  end
end