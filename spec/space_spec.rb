describe Space do
  describe '.create' do
    it 'creates a new space with price, name and description properties' do
      space = Space.create(price: 20, name: "Central London Apartment", description: "Cosy and small")
      expect(space.price).to eq 20
      expect(space.name).to eq "Central London Apartment"
      expect(space.description).to eq "Cosy and small"
    end
  end
end
