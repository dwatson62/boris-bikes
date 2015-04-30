require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike}
  it { is_expected.to respond_to :dock}
  it { is_expected.to respond_to(:dock).with(1).argument}
  describe 'release_bike' do
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end
    # it 'releases a working bike and not a broken one' do
    #   subject.dock (Bike.new)
    #   subject.dock (Bike.new).report_broken
    #   expect(subject.release_bike).to be_working
    # end

  end
  describe 'dock' do
    it 'raises an error when full' do
      capacity = subject::capacity
      capacity.times {subject.dock Bike.new}
      expect {subject.dock Bike.new}.to raise_error 'Docking station full'
    end
    it 'raises an error when full with default capacity' do
      expect(subject::capacity).to eq 20
    end
    it 'raises an error when full extended capacity is 40' do
      docking_station = DockingStation.new(40)
      expect(docking_station::capacity).to eq 40
    end
  end
end