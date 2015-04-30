require 'docking_station'

feature 'member of public accesses bike' do
  scenario 'docking station releases a working bike' do
    docking_station = DockingStation.new
    docking_station.dock Bike.new
    bike = docking_station.release_bike
    expect(bike).to be_working
  end

  scenario 'docking station does not release a bike when there are none available' do
    docking_station = DockingStation.new
    expect {docking_station.release_bike }.to raise_error 'No bikes available'
  end
 #  scenario 'docking station does not release broken bikes' do
 #    docking_station = DockingStation.new
 #    bike = Bike.new
 #    bike.report_broken
 #    docking_station.dock bike
 #    expect {docking_station.release_bike}.to raise_error 'No bikes available'
 # end
end

feature 'member of public returns bike' do
  scenario 'bike cannot be docked when station is full with default capacity' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq 20
  end
  scenario 'bike cannot be be docked when station reaches extended capacity' do
    docking_station = DockingStation.new(50)
    50.times {docking_station.dock(Bike.new)}
    expect {docking_station.dock Bike.new }.to raise_error 'Docking station full'
  end
  scenario 'bike can be reported broken when returned' do
    docking_station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    expect { docking_station.dock bike }.not_to raise_error
  end
end
