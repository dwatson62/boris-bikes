require 'bike_container'

shared_examples_for BikeContainer do
  it 'has a default capacity when intialized' do
    expect(subject.capacity).to eq BikeContainer::DEFAULT_CAPACITY
  end

  describe 'capacity' do
    it 'can be overriden on initialize' do
      random_capacity = Random.rand(100)
      subject = described_class.new random_capacity
      expect(subject.capacity).to eq random_capacity
    end
  end

  describe 'add_bike' do
    it 'receives a bike' do
      subject.add_bike double :bike
      expect(subject).not_to be_empty
    end
    it 'raises an error when full' do
      subject.capacity.times { subject.add_bike double(:bike) }
      expect { subject.add_bike double(:bike) }.to raise_error "#{described_class.name} full"
    end
  end

end

class BikeContainerTest; include BikeContainer; end

describe BikeContainerTest do
  it_behaves_like BikeContainer
end