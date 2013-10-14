require 'person'

describe Person do 
  let(:person) {Person.new}
   

  it 'has no bike' do
    expect(person).not_to have_bike
   end 	

  it 'has a bike' do
  	person = Person.new(:bike)
  	expect(person).to have_bike
  end	

  it 'can break a bike' do
  	bike = double :bike
    person = Person.new bike
    expect(bike).to receive(:break!)

    person.fall_down
  end
  
  it 'can rent a bike from station' do
  	station = double :station
  	expect(station).to receive(:release_bike)

  	person.rent_bike_from(station)
  end


  it 'has a bike after renting it from a station' do
    station = double :station, {:release_bike => :bike }
    person.rent_bike_from(station)
    
    expect(person).to have_bike
  end


  it 'can return bike to station' do
  	station = double :station
    expect(station).to receive(:bike_in)
    
    person.drops_off_bike(station)

  end
  
end