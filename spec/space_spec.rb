describe Space do
  subject(:space) {described_class.new(price: 20, name: "Central London Apartment", description: "Cosy and small", start_date: "2019-06-05", end_date: "2020-06-05")}

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
