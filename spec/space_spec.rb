describe Space do
  subject(:space) {described_class.new(price: 20, name: "Central London Apartment", description: "Cosy and small", start_date: "2019-06-05", end_date: "2020-06-05")}

  describe '.available' do
    let(:booking_class) { double(:booking_class, booked?: true) }
    
    it 'returns all available spaces' do
      allow(Space).to receive(:booking_class) { booking_class }
      space = Space.create(name: 'MySpace', description: 'A cool space', price: 100, start_date: '2019-10-22', end_date: '2020-10-22')

      expect(booking_class).to receive(:booked?).with(space.id, '2019-12-25')
      expect(Space.available('2019-12-25')).to be nil
    end
  end

  describe '.create' do
    it 'creates a new space with price, name and description properties' do
      expect(space.price).to eq 20
      expect(space.name).to eq "Central London Apartment"
      expect(space.description).to eq "Cosy and small"
    end

    it 'creates time object from start and end date' do
      expect(space.start_date.day).to eq 5
      expect(space.start_date.month).to eq 6
      expect(space.start_date.year).to eq 2019
      expect(space.end_date.day).to eq 5
      expect(space.end_date.month).to eq 6
      expect(space.end_date.year).to eq 2020
    end
  end
end
