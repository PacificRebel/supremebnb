describe @booking do
  before :each do
    @space = Space.create(
      name: 'taj mahal', 
      start_date: '2019-10-23', 
      end_date: '2020-10-23', 
      price: 100, 
      description: 'cool')
    @user = User.create(username: 'name')
    @date = "2019-12-25"
    @booking = Booking.create(space_id: @space.id, guest_id: @user.id, date: @date)
  end
  
  it 'knows its @space_id' do
    expect(@booking.space_id).to eq @space.id
  end
  it 'knows its guest_id' do
    expect(@booking.guest_id).to eq @user.id
  end
  it 'knows its @booking @date' do
    expect(@booking.date).to eq Date.new(2019,12,25)
  end
  it 'knows its approval status' do
    expect(@booking.approved?).to be_falsey
  end
  
  describe 'approve!' do
    it 'approves the @booking' do
      expect(@booking.approved?).to be_falsey
      @booking.approved!
      expect(@booking.approved?).to be true
    end
  end

  describe '.booked?' do
    it 'returns false if no approved @bookings exist' do
      expect(Booking.booked?(@space.id, @date)).to eq false
    end
    it 'returns true if approved @bookings exist' do
      @booking.approved!
      expect(Booking.booked?(@space.id, @date)).to eq true
    end
  end
end